function image(){
	var bg = $('.team-venue').text();
	$('body').css('background-image','url('+bg+')');
}
// DOM events
	$(function(){
		image();
	});
