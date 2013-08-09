var city = $('.current-user-city').text();
var i = 0;

// FIND YOUR TEAM
function espn_find_team() {
	var source_teams = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/?apikey=4u3e6enmscdszh8qcy9dh7my';

	$.ajax({
		url: source_teams,
		dataType: "jsonp",
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
		},
		cache: false,
		type: "get"
	}).done(function(data) {
		console.log(data);

		// run a function to split the league up into teams
		for (var i = 0; i < data.length; i++) {
			creates_a_team(i);
		}
		});
}

// 1. FIND TEAM RECORD. DISPLAY NAME
function get_team_info(index){
  var team_id = data[location];
  // var id = "http://farm"+ photo.farm +".static.flickr.com/"+ photo.server +"/"+ photo.id +"_"+ photo.secret +"_m.jpg";
  console.log(team_id);
  return team_id;
}

// 2.  MAKE A TEAM BUCKET THAT TAKES A TEAM
function creates_a_team(i) {
	//making a container
	var team = $('<article>').addClass('team');
	//assigning a team to a container
	team.attr('id', get_teams_info(i));
	//add container to the appropriate section on fans profile
	$('#my-leagues .sleeve').append(team).html();
	console.log(team);
	return;
}

// // GET NEWS
// function espn_find_news() {
// 	$.ajax({
// 		url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/headlines?keywords=Seattle',
// 		data: {
// 			// enter your developer api key here
// 			apikey: "4u3e6enmscdszh8qcy9dh7my",
// 			// the type of data you're expecting back from the api
// 			_accept: "application/json"
// 		},

// 		dataType: "json",
// 		beforeSend: function(xhr) {
// 			xhr.setRequestHeader("Accept", "application/json");
// 		},
// 		cache: false,
// 		type: "get"
// 	}).done(function(data) {
// 		var results = data;
// 		console.log(results);
// 		my_news = JSON.stringify(results);
// 		// $.inArray(my_target, Object.keys(data))
// 		$("<div>" + my_news + "</div>").appendTo("#my-news .sleeve").text();
// 	});
// }

// // GET VIDEOS
// function youtube_find_channel(){
// $.ajax({
// 		url: 'http://www.youtube.com/user/mls?&key=AIzaSyDRWryJz70D_ybAHQmhuiwgrHtYOuEo9tA&part=player',
// 		data: {
// 		_accept: "application/json"
// 		},
// 		dataType: "json",
// 		beforeSend: function(xhr){
//        xhr.setRequestHeader("Accept","application/json");},
// 		cache: false,
// 		type:"get"
// 		}).done(function(data){
// 		// $.inArray(my_target, Object.keys(data))
// 			$("<div>"+ data + "</div").appendTo("#match-day").text();
// 		});
// }

//SETS UP MATCH

function match_day() {
	console.log('match day!');
}

// on load events
$(function() {
	espn_find_team();
	// espn_find_news();
	// youtube_find_channel();
	// match_day();
});