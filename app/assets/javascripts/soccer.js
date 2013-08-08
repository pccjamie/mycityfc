var city = $('.current-user-city').text();	

// GET LEAGUES & TEAMS
function espn_find_leagues(){
var source_teams = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/?apikey=4u3e6enmscdszh8qcy9dh7my';

	$.ajax({
		url: source_teams,
		dataType: "json",
		beforeSend: function(xhr){
       xhr.setRequestHeader("Accept","application/json");},
		cache: false,
		type:"get"
	}).done(function(data){
			console.log(data);
			var results = data;
			console.log(results);
			headlines = JSON.stringify(results);
		// $.inArray(my_target, Object.keys(data))
			$("<div>"+ headlines + "</div>").appendTo("#my-leagues .sleeve").text();
		});
}


// GET NEWS
function espn_find_news(){
	$.ajax({
		url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/headlines?keywords=Seattle',
		data: {
		// enter your developer api key here
		apikey: "4u3e6enmscdszh8qcy9dh7my",
		// the type of data you're expecting back from the api
		_accept: "application/json"
		},

		dataType: "json",
		beforeSend: function(xhr){
       xhr.setRequestHeader("accept","application/json");},
		cache: false,
		type:"get"
		}).done(function(data){
			var results = data;
			console.log(results);
			my_news = JSON.stringify(results);
		// $.inArray(my_target, Object.keys(data))
			$("<div>"+ my_news + "</div>").appendTo("#my-news .sleeve").text();
		});
}

// GET VIDEOS
function youtube_find_channel(){
//method to find a specific teams's channel. should i make this dependent on the ESPN api? 
}

// SETS UP MATCH
// function match_day(){
// console.log('match_day!');
// }



// on load events
$(function() {
	espn_find_leagues();
	espn_find_news();
	youtube_find_channel();
});