//SETS UP MATCH

function match_day() {
	console.log('Match Day! Slide down!');
	// if (#schedule.has(now)){
	// $('match-day').css('display','block');
	// }
}

// // on load events
// $(function() {
// });

//click to open

$(".match-trigger").click(function() {
	$('#js-match-day').slideToggle('500', function(){

		$('.modal-shield').css({'display':'block','z-index':'10'});

	});
});