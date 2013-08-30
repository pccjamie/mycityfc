function image(){
	var bg = $('.team-venue-image:first').text();
	console.log(bg);
	$('body').css('background-image','url('+bg+')');
}
// DOM events
	$(function(){
		image();
	});
