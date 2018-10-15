// Broadcast Types
const JOIN_ROOM = "JOIN_ROOM";
const EXCHANGE = "EXCHANGE";
const REMOVE_USER = "REMOVE_USER";

// DOM Elements
let current_user;
let localVideo;
let remoteVideoContainer;

// Objects
let pcPeers = {};
let localstream;

window.onload = () => {
  current_user = document.getElementById("current-user").innerHTML;
  localVideo = document.getElementById("local-video");
  remoteVideoContainer = document.getElementById("remote-video-container");
};

// Ice Credentials
const ice = { iceServers: [{ urls: "stun:stun.l.google.com:19302" }] };

// Initialize user's own video
document.onreadystatechange = () => {
  if (document.readyState === "interactive") {
    navigator.mediaDevices
      .getUserMedia({
        audio: false,
        video: true
      })
      .then(stream => {
        localstream = stream;
        localVideo.srcObject = stream;
        localVideo.muted = true;
      })
      .catch(logError);
  }
};

const handleJoinSession = async () => {
  // connect to Action Cable
  // Switch over broadcasted data.type and decide what to do from there
  App.session = await App.cable.subscriptions.create("SessionChannel", {
    connected: () => {
      broadcastData({
        type: JOIN_ROOM,
        from: current_user
      });
    },
    received: data => {
      console.log("received", data);
      if (data.from === current_user) return;
      switch (data.type) {
        case JOIN_ROOM:
          return joinRoom(data);
        case EXCHANGE:
          if (data.to !== current_user) return;
          return exchange(data);
        case REMOVE_USER:
          return removeUser(data);
        default:
          return;
      }
    }
  });
};

const handleLeaveSession = () => {
  // leave session
  for (user in pcPeers) {
    pcPeers[user].close();
  }
  pcPeers = {};

  App.session.unsubscribe();

  remoteVideoContainer.innerHTML = "";

  broadcastData({
    type: REMOVE_USER,
    from: current_user
  });
};

const joinRoom = data => {
  // create a peerConnection to join a room
  createPC(data.from, true);
};

const removeUser = data => {
  // remove a user from a room
  console.log("removing user", data.from);
  let video = document.getElementById(`remoteVideoContainer+${data.from}`);
  video && video.remove();
  delete pcPeers[data.from];
};

const createPC = (userId, isOffer) => {
  // new instance of RTCPeerConnection
  // potentially create an "offer"
  // exchange SDP
  // exchange ICE
  // add stream
  // returns instance of peer connection
  let pc = new RTCPeerConnection(ice);
  pcPeers[userId] = pc;
  pc.addStream(localstream);

  isOffer &&
    pc
      .createOffer()
      .then(offer => {
        return pc.setLocalDescription(offer);
      }).then(() => {
        broadcastData({
          type: EXCHANGE,
          from: current_user,
          to: userId,
          sdp: JSON.stringify(pc.localDescription)
        });
      })
      .catch(logError);

  pc.onicecandidate = event => {
    event.candidate &&
      broadcastData({
        type: EXCHANGE,
        from: current_user,
        to: userId,
        candidate: JSON.stringify(event.candidate)
      });
  };

  pc.onaddstream = event => {
    const element = document.createElement("video");
    element.id = `remoteVideoContainer+${userId}`;
    element.autoplay = "autoplay";
    element.srcObject = event.stream;
    remoteVideoContainer.appendChild(element);
  };

  pc.oniceconnectionstatechange = event => {
    if (pc.iceConnectionState == "disconnected") {
      console.log("Disconnected:", userId);
      broadcastData({
        type: REMOVE_USER,
        from: userId
      });
    }
  };

  return pc;
};

const exchange = data => {
  // add ice candidates
  // sets remote and local description
  // creates answer to sdp offer
    let pc;

  if (!pcPeers[data.from]) {
    pc = createPC(data.from, false);
  } else {
    pc = pcPeers[data.from];
  }

  if (data.candidate) {
    pc
      .addIceCandidate(new RTCIceCandidate(JSON.parse(data.candidate)))
      .then(() => console.log("Ice candidate added"))
      .catch(logError);
  }

  if (data.sdp) {
    sdp = JSON.parse(data.sdp);
    pc
      .setRemoteDescription(new RTCSessionDescription(sdp))
      .then(() => {
        if (sdp.type === "offer") {
          pc.createAnswer().then(answer => {
            return pc.setLocalDescription(answer);
          }).then(()=> {
            broadcastData({
              type: EXCHANGE,
              from: current_user,
              to: data.from,
              sdp: JSON.stringify(pc.localDescription)
            });
          });
        }
      })
      .catch(logError);
  }
};

const broadcastData = data => {
  fetch("sessions", {
    method: "POST",
    body: JSON.stringify(data),
    headers: { "content-type": "application/json" }
  });
};

const logError = error => console.warn("Whoops! Error:", error);