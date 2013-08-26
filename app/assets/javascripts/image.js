function image(){
	var bg = $('a.team-info img').attr('href');
	$('body').css('background-image','url('+bg+')');
}
// DOM events
	$(function(){
		$('body').css('background-image','none');
		image();
	});
