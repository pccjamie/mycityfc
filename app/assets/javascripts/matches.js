// // GET VIDEOS

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

$("#match-trigger, #panel-trigger").click(function() {
	$('#match-day').slideToggle();
});