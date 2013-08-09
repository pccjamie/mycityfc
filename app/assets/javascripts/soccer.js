// var city = $('.current-user-city').text();
var city = 'Seattle';
var i = 0;
var results;
var match;
var record;
// FIND YOUR TEAM
function espn_find_team(){
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
			$.each(raw.sports[0].leagues[0].teams, function(index, team){
			console.log('This team is the ' + team.location + ' ' + team.name + ' ' + team.abbreviation);
				

				var info = [raw.sports[0].leagues[0].teams];
				var test = $(this).attr("class","team");
				console.log(test);
				var links = JSON.stringify(this.links.web.teams);
				$('#my-leagues').append("<div class=team>"+ this.location + '<br/>'+this.name +'<br/>'+ links + "</div>");
				

				// var match, all;
				// // $.each(all, function() {
				// //     if (this.name === city {
				// //         match = this;
				// //         return false;
				// //     }
				// // });

				
		

				// $('#my-leagues').append($(this).val();
				// $("#my-leagues").append(temp);
				// console.log(temp);

			
			});
		});
}
// //2.  MAKE A TEAM BUCKET THAT TAKES A TEAM
// function create_a_team(i){
// //making a container
// 	var teambucket = $('<article>').addClass('.team').css('background-color','yellow');
// 	console.log('set up empty containers');
// 	//assigning a team to a container
// 	// team.attr('id', get_team_info(i));
// 	// //add container to the appropriate section on fans profile
// 	$('#my-leagues .sleeve').append(single_team).html();
// 	console.log(single_team);
// }

// // 1. FIND TEAM RECORD. DISPLAY NAME
// 	function get_team_info(){
// 	console.log('entered function - get team info');
// // 	var team_id = results[index];
// // 	return team_id;
// }

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

// //SETS UP MATCH

// function match_day() {
// 	console.log('match day!');
// }

// on load events
$(function() {
	espn_find_team();
	// espn_find_news();
	// youtube_find_channel();
	// match_day();
});