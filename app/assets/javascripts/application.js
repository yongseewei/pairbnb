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
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	$("#filter-button").click(function(){
		$("#filter-listings").slideDown()
		$("#filter-button").hide()
	});
	$("#filter-listings .filter-cancel").click(function(){
		$("#filter-listings").slideUp()
		$("#filter-button").show()
	});

	$("#filter-submit").change(function(e, data, status, xhr){
		// debugger
		$.ajax({
			type: 'GET',
			url: $(this).attr('action'),
			data: $(this).serialize(),
			dataType: "script",
			success: function(msg) {
					// debugger;
			}
		});
	})
	// $("#filter-submit").on("ajax:success", function(e, data, status, xhr){

	// 	debugger
	// });
	// $("#filter-submit").submit(function(event){
	// 		// $("form").submit(function(event){
	// 		// 	debugger;
	// 		// });
	// 	var element = this;
	// 	// debugger
	// 	// event.preventDefault();
	// 	$.ajax({
	// 		type: 'POST',
	// 		url: $(element).attr('action'),
	// 		data: $(element).serialize(),
	// 		dataType: "json",
	// 		success: function(msg) {
	// 				debugger;
	// 		}
	// 	});
	// 	// return false;
	// 	// alert("123")
	// });
});