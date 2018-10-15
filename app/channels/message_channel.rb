class MessageChannel < ApplicationCable::MessageChannel
	def subscribed
		stream_from "message_channel"
	end

	def unsubscribed

	end

	def send_message(data)
		current_user.message.create(body: data['message'])
	end

end