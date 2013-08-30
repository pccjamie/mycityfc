function location_changes(){
	var bg = $('.team-venue-image:first').text();
	$('body').css('background-image','url('+bg+')');
	$('.team:first').after('<h5>Other teams near you</h5>').nextAll().addClass('secondary').remove('.team-feed,.team-links');
}
// DOM events
	$(function(){
		location_changes();
	});
