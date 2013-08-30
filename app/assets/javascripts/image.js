function location_based_content(){
	var bg = $('.team-venue-image:first').text();
	$('body').css('background-image','url('+bg+')');
	$('.team:first').after('<h5>Other teams near you</h5>').nextAll().addClass('secondary');
}
// DOM events
	$(function(){
		location_based_content();
	});
