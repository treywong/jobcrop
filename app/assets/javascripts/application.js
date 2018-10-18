// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require trix
//= require Chart.bundle
//= require chartkick
//= require rails-ujs
//= require jquery3
//= require jquery.waypoints.min
//= require inview.min
//= require jquery.slick
//= require popper
//= require bootstrap
//= require moment
//= require activestorage
//= require turbolinks
//= require cable
//= require_tree .


$(document).on("turbolinks:load", function(){
  $('#flash').fadeOut(5000)

  $('.features-landing-row').hide();

  $("div.searchbox-landing a").one('click',function(){
		$('html, body').animate({
			scrollTop: $(".features-landing").offset().top
		}, 1000);
    var inview = new Waypoint.Inview({
      element: $('.features-landing')[0],
      exit: function() {
        $('.features-landing').hide();
        $('.features-landing-row').fadeIn();
      }
    })
	});

  $('.jobs-carousel').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3
  });

})

document.addEventListener('ajax:beforeSend', function(event) {
  $(".spinner").show();
  $(".job-list").hide();
  $(".search-intro").hide();
  $(".no-result-card").hide();
})

document.addEventListener('ajax:success', function(event) {
  $(".spinner").hide();
  $(".job-list").show();
})
