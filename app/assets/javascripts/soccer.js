// var city = $('.current-user-city').text();
var my_location = "Seattle";
var i = 0;
// var results;
// var match;
// var record;

// FIND YOUR TEAM

// function espn_find_team() {
// 	var source_teams = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/';
// 	// console.log('entered function - espn find team');
	
// 	$.ajax({
// 		url: source_teams,
// 		data: {
// 			apikey: '4u3e6enmscdszh8qcy9dh7my',
// 			_accept: "application/json"
// 		},
// 		dataType: "jsonp",
// 		beforeSend: function(xhr) {
// 			xhr.setRequestHeader("Accept", "application/json");
// 		},
// 		cache: false,
// 		type: "get"
// 	}).done(function(data) {
// 		$.each(data.sports[0].leagues[0].teams, function(index, team) {
// 			console.log(index + ': ' + team.location + '-' + team.name);
// 			var click;
// 			$('#my-teams .sleeve').append("<div class=team>" + this.location + ' ' + this.name + "</div>");
// 		});

// 	});
// }


function find_team_info() {
	var espn = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/';
	// console.log('entered function - espn find team');
	
	$.ajax({
		url: espn,
		data: {
			apikey: '4u3e6enmscdszh8qcy9dh7my',
			_accept: "application/json"
		},
		dataType: "jsonp",
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
		},
		cache: false,
	type: "get"
}).done(function(data) {

	$.each(data.sports[0].leagues[0].teams, function(index,team){
				$.each(team, function(index, info){
						// console.log('Raw: ' + info);
						info = $(info);
						info.slice(5,7);
						// console.log('Result after splice: ' + info);
						$.each(info, function(index, linkset){
								// console.log(urls);
									$.each(linkset, function(index, set){
										// console.log(set);
										$.each(set, function(index, contents){
											// console.log(singleurl);
											$.each(contents, function(index, cheese){
												// console.log(onelink);
												console.log(cheese);

													$('#my-teams * nav').append("<div>" + cheese + "</div>");

											});
										});
									});
								
								
					
						});
				});
			});
		});
	}


		// // GET NEWS

		// function espn_find_news() {
		// 	$.ajax({
		// 		url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/',
		// 		data: {
		// 			apikey: "4u3e6enmscdszh8qcy9dh7my",
		// 			_accept: "application/json"
		// 		},
		// 		dataType: "jsonp",
		// 		beforeSend: function(xhr) {
		// 			xhr.setRequestHeader("Accept", "application/json");
		// 		},
		// 		cache: false,
		// 		type: "get"
		// 	}).done(function(data) {
		// 		raw = data;
		// 		// $.each(raw.headlines[0].categories[2], function(index, team) {
		// 		// console.log('This team has a headline: ' + team.headline);

		// 		$.each(raw.headlines, function(index, team) {
		// 			var info = [raw.headlines];
		// 			// var info = [raw.headlines[0].categories[2].teams];
		// 			var test = $(this).attr("class", "team-headline");
		// 			$('#my-news .sleeve').append("<div class=team-headline>" + this.headline + "</div>");
		// 		});
		// 	});
		// }

		// on load events
		$(function() {
			//espn_find_team();
			find_team_info();
			// espn_find_news();
		});