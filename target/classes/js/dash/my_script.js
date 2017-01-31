$(document).ready( function() {
 $.getJSON( "json_data.json", function(obj) { 
  $.each(obj, function(key, value) { 
	  $('#gg').attr('href',value.google);
	  $('#yh').attr('href',value.yahoo);
	  $('#fb').attr('href',value.facebook);
  });
 });
});