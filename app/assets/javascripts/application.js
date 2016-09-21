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
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	
	 // var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
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

	$(document).on("focus","#dateFrom, #dateTo",function(event){
		$('#dateFrom, #dateTo').datepicker({
	    beforeShow: customRange,
	    // beforeShowDay: DisableSpecificDates,
	    dateFormat: "dd M yy",
    })
  });
  $(document).on("change","#dateFrom, #dateTo",function(event){
	  if ($('#dateFrom').val() != "" && $('#dateTo').val() != ""){
	  	debugger
	  }
	});

  if ($("#error-message-reservations").length){
  	
  	var listing = "/listings/" + $("#error-message-reservations").attr("data-id")
		window.history.pushState("object or string", "Title", listing);		
	}

	// function DisableSpecificDates(date) {
	// 	var disableddates = $("#list_show").attr("data-id");
 //    var string = jQuery.datepicker.formatDate('dd-mm-yy', date);
 //    return [disableddates.indexOf(string) == -1];
 //  }

	function customRange(input) {

    if (input.id == 'dateFrom') {
      var minDate = new Date();
      minDate.setDate(minDate.getDate())

      return {
          minDate: minDate

      };
    }

    if (input.id == 'dateTo') {
    	if($('#dateFrom').val() == ""){
    		var minDate = new Date();
    	}
			else{
	      var minDate = new Date($('#dateFrom').val());		
			}
      minDate.setDate(minDate.getDate() + 1)

      return {
          minDate: minDate

      };
    }

    return {}

	}	

      
      
 
    
});