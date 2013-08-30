function image(){
	var bg = $('.team-venue-image').text();
	console.log(bg);
	$('body').css('background-image','url('+bg+')');
}
// DOM events
	$(function(){
		image();
	});
