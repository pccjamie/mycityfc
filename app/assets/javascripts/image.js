function location_based_content(){
	var bg = $('.team-venue-image:first').text();
	$('body').css('background-image','url('+bg+')');
	$('.team:first').nextAll().addClass('secondary');
}
// DOM events
	$(function(){
		location_based_content();
	});
