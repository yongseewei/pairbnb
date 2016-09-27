$(document).ready(function(){
	var numbers = new Bloodhound({
	  remote: {url: "/listings/autocomplete?query=%QUERY",
	    wildcard: "%QUERY"},
	  datumTokenizer: function(d) { 
	          return Bloodhound.tokenizers.whitespace(d.title); },
	  queryTokenizer: Bloodhound.tokenizers.whitespace
	});

	// initialize the bloodhound suggestion engine

	numbers.initialize();


	// instantiate the typeahead UI
	$('#query').typeahead({
    hint: false,
    highlight: true,
    minLength: 1
  }, {
	  displayKey: 'title',
	  source: numbers.ttAdapter()
	});

})