function image(){
	var bg = $('img.stadium').attr('href');
	console.log(bg);
	$('body').css('background-image','url('+bg+')');
}
// DOM events
	$(function(){
		$('body').css('background-image','none');
		image();
	});
