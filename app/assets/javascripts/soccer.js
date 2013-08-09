// var city = $('.current-user-city').text();
var my_location = "Seattle";
var i = 0;
var results;
var match;
var record;
var entry;
// FIND YOUR TEAM

function espn_find_team() {
	var source_teams = 'http://api.espn.com/v1/sports/soccer/usa.1/teams?apikey=4u3e6enmscdszh8qcy9dh7my';
	// console.log('entered function - espn find team');
	$.ajax({
		url: source_teams,
		dataType: "jsonp",
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
		},
		cache: false,
		type: "get"
	}).done(function(data) {
		raw = data;
		$.each(raw.sports[0].leagues[0].teams, function(index, team) {
			console.log('This team is the ' + team.location + ' ' + team.name + ' ' + team.abbreviation);
			var info = [raw.sports[0].leagues[0].teams];
			var test = $(this).attr("class", "team");
			console.log(test);
			var links = JSON.stringify(this.links.web.teams);
			// var espn_link = links.replace(/{"href":"//,'');
			$('#my-teams .sleeve').append("<div class=team>" + this.location + ' ' + this.name + '<br/>' + links + "</div>");
		});

	// // var match;
	// // $.each(test, function() {
	// // 	if (this.location:contains('Seattle') {
	// // 		match = this;
	// // 		return false;
	// // 	}
	// });
});
}

// // GET NEWS
function espn_find_news() {
	$.ajax({
		url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/',		
		data: {
		apikey: "4u3e6enmscdszh8qcy9dh7my",
		_accept: "application/json"
		},
		dataType: "jsonp",
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
		},
		cache: false,
		type: "get"
	}).done(function(data) {
		raw = data;
		// $.each(raw.headlines[0].categories[2], function(index, team) {
		// console.log('This team has a headline: ' + team.headline);

		$.each(raw.headlines, function(index, team) {
			var info = [raw.headlines];
			// var info = [raw.headlines[0].categories[2].teams];
			var test = $(this).attr("class", "team-headline");
			$('#my-news .sleeve').append("<div class=team-headline>" + this.headline + "</div>");
		});
	});
}

// GET VIDEOS
function youtube_find_channel(){
$.ajax({
		url: 'http://www.youtube.com/user/mls?&key=AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA&part=player',
		data: {
		_accept: "application/json"
		},
		dataType: "jsonp",
		beforeSend: function(xhr){
       xhr.setRequestHeader("Accept","application/json");},
		cache: false,
		type:"get"
		}).done(function(data){
			console.log(data);
			// $("<div>"+ data + "</div").appendTo("#match-day").text();
		});
}

//SETS UP MATCH

function match_day() {

	// var dd = today.getDate();
	// var mm = today.getMonth()+1; //January is 0!
	// var yyyy = today.getFullYear();
	// if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm} today = mm+'/'+dd+'/'+yyyy;
	// var today = document.write(today);
	console.log('Match Day! Slide down!');
	// if (#schedule.has(now)){
	//$('match-day').css('display','block');
	// }

}

// on load events
$(function() {
	espn_find_team();
	espn_find_news();
	// youtube_find_channel();
});

$( "#trigger" ).click(function() {
$( '#match-day').slideToggle();
});