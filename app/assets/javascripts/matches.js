// GET VIDEOS

// function youtube_find_channel() {

// 	$.ajax({
// 		url: 'http://www.youtube.com/user/mls?&key=AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA&part=player',
// 		data: {
// 			_accept: "application/json"
// 		},
// 		dataType: "jsonp",
// 		beforeSend: function(xhr) {
// 			xhr.setRequestHeader("Accept", "application/json");
// 		},
// 		cache: false,
// 		type: "get"
// 	}).done(function(data) {
// 		console.log(data);
// 		// $("<div>"+ data + "</div").appendTo("#match-day").text();
// 	});
// }


//SETS UP MATCH
function match_day() {
	console.log('Match Day! Slide down!');
	// if (#schedule.has(now)){
	// $('match-day').css('display','block');
	// }
}

// on load events
$(function() {
	// youtube_find_channel();

});

$("#trigger").click(function() {
	$('#match-day').slideToggle();
});