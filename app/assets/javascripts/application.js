// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require masonry/jquery.masonry
//= require jquery-ui
//= require private_pub
//= require chat
//= require bootstrap-sprockets
//= require turbolinks
//= require jquery-readyselector
//= require_tree .

$(document).ready(function(){
	$(document).on("click","#filter-button",function(event){
		$("#filter-listings").slideDown()
		$("#filter-button").hide()
	});

	$(document).on("click","#filter-listings .filter-cancel",function(event){
		$("#filter-listings").slideUp()
		$("#filter-button").show()
	});

	$(document).on("change","#filter-submit",function(event){
		$.ajax({
			type: 'GET',
			url: $(this).attr('action'),
			data: $(this).serialize(),
			dataType: "script",
			success: function(msg) {}
		});
	})

  if ($("#error-message-reservations").length){ 	
  	var listing = "/listings/" + $("#error-message-reservations").attr("data-id")
		window.history.pushState("object or string", "Title", listing);		
	}

	$(".transactions").ready(function() {
		var title = document.location.pathname;
		window.history.pushState("object or string", "Title", title);		
	});

	$(window).scroll(function() {
    if($(this).scrollTop() > 50)  /*height in pixels when the navbar becomes non opaque*/ 
    {
       $('#pairbnb-navbar').addClass('opaque');
    } else {
       $('#pairbnb-navbar').removeClass('opaque');
    }
	});
    
});