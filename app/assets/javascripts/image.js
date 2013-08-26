function image(){
	console.log($('#products').data('url'));
	
}

// DOM events
	$(function(){
		$('body').css('background-image','none');
		image();
	});
