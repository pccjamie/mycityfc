//var city = $('li.current-user-city').html();
//var city = city.toLowerCase();
var city = 'seattle';
var espn = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/';

// //GET TEAM ID
// $.ajax({
// 	url: espn,
// 	data: {
// 		apikey: '4u3e6enmscdszh8qcy9dh7my',
// 		_accept: "application/json"
// 	},
// 	dataType: "jsonp",
// 	beforeSend: function(xhr) {
// 		xhr.setRequestHeader("Accept", "application/json");
// 	},
// 	cache: false,
// 	type: "get"
// }).done(function(data) {
// 		$.each(data.sports[0].leagues[0].teams, function(index, team) {
// 					team_id = team.id;
// 					return this;
// 			});	return;
// 	});

// // GET INFO
// function find_team_info() {

// 	var espn_links;

// 	$.ajax({
// 		url: espn,
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

// 			console.log(team_id);
// 		$.each(data.sports[0].leagues[0].teams, function(index, team) {

// 			var team_name = team.name.toLowerCase();
// 			var team_location = team.location.toLowerCase();
// 			var team_id = team.id;

// 		// $('#my-teams * .team-feed header').append("<div class=feed-data>" + team_location + "</div>");
// 		// $("#my-teams * .feed-data:contains('" + city + "')").css("display", "block");
// 			$.each(team, function(index, info) {

// 				info2 = $(info);
// 				info2.slice(5, 7);

// 				$.each(info2, function(index, linkset) {
// 					$.each(linkset, function(index, set) {

// 						$.each(set, function(index, contents) {
// 							$.each(contents, function(index, espn_links) {
// 								$('<a class="espn-links" href='+espn_links+'><span class="hideme">'+espn_links+'</span>'+ team_name +' on ESPN</a>').appendTo('.team-feed nav');
// 								$("#my-teams * a:contains('usa.1')").remove();
// 								$("#my-teams * a:contains('" + city + "')").css("display", "block");
// 								$("#my-teams * br").remove();
// 							});
// 						});
// 					});
// 				});
// 			});
// 		});
// 	});
// 	return;
// }


//GET NEWS

function find_news() {
	$.ajax({
		url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/headlines/',
		data: {
			apikey: "4u3e6enmscdszh8qcy9dh7my",
			_accept: "application/json",
			limit: 10
		},
		dataType: "jsonp",
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
		},
		cache: false,
		type: "get"
	}).done(function(data) {

		$.each(data.headlines, function(index, article) {

			$('#ticker #js-headlines').append("<article><a href=" + article.links.web.href + ">" + article.title + "</a></article>");
			// $('#my-news .sleeve article').append("<div class=images>" + article.images+"</div>");
			console.log(article.categories);
		});
	});
}

$("#banner").on("click", ".news-trigger", function(e) {
	e.preventDefault();
	$("#js-headlines article:first").nextAll().css('display', 'block');
	$("#js-headlines").toggleClass('exposed');

});


function switch_leagues() {
	$('.js-tabs').cycle({
		manualSpeed: 100
	});
}

//change BG based on closest team

function location_based_view() {
	//if no primary team, use background for team closest
	var bg = $('.team-venue-image:first').text();
	//else use background for team chosen
	$('body').css('background-image', 'url(' + bg + ')');
	$('#js-match-day').css('background-color', 'rgba(0,0,0,.60');
	//$('#js-match-day').css('background-image', 'url(' + bg + ')');

	$('.team:first').addClass('primary');
	$('.team:first').after('<h5>A little farther away...</h5><br/>').nextAll().addClass('secondary');
}

function afterCss() {
	// $(temp).first().animate({'height':'200px','background':'red'});
}

function filter_games() {
	//retrive user's preferred team from DOM text.
	var my_team = $('h3.my-team').text();

	if ($(".single-game:contains('" + my_team + "')")) {

		$(".single-game:contains('" + my_team + "')").css("display", "block");
		//ensuring this occurs before further action.
		//setTimeout(afterCss, 10);
	} 

	else {
		console.log('No team selected.')
	}

}



// ON LOAD
$(function() {
	location_based_view();
	//find_team_info();
	find_news();
	switch_leagues();
	filter_games();

});