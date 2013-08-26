function image(){
	var bg = $('#image .team-info').html;
	console.log(bg);
	$('body').css('background-image','url('+bg+')');
}
// DOM events
	$(function(){
		$('body').css('background-image','none');
		image();
	});
