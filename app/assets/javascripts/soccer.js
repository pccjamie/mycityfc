//var city = $('li.current-user-city').html();
//var city = city.toLowerCase();
var espn = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/';

// makes layout / visual changes based on current page url

function location_based_view() {

	if (window.location.href.indexOf("fan") > -1) {
	
			$('#nearby-teams * .team-venue-image').each(function (){
				var venue = $(this).text();
				console.log(venue);
				$(this).parent().parent().css('background-image', 'url(' + venue + ')');
			});


		// console.log('add code to change bg based on primary team');

	}
	
	else {

		//else do this for these other pages.

		var root = window.location.pathname == ("/");

		if (window.location == root) {
			$('body').css('bg-parent-profiles');
		}

		if (window.location.href.indexOf("parent") > -1) {
			$('body').addClass('bg-parent-profiles');
		}

		if (window.location.href.indexOf("slides") > -1) {
			$('body').addClass('bg-slides');
		}

	}

	// some minor changes to styles for location based content.
	$('.team:first').addClass('primary');
	//should not run if there are no other teams in the area defined by controller
	$('.team:first').after('<h5>A little farther away...</h5><div class="clearfix"></div>').nextAll().addClass('secondary');

}


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

// 		console.log(team_id);
// 		$.each(data.sports[0].leagues[0].teams, function(index, team) {

// 			var team_name = team.name.toLowerCase();
// 			var team_location = team.location.toLowerCase();
// 			var team_id = team.id;

// 			// $('#my-teams * .team-feed header').append("<div class=feed-data>" + team_location + "</div>");
// 			// $("#my-teams * .feed-data:contains('" + city + "')").css("display", "block");
// 			$.each(team, function(index, info) {

// 				info2 = $(info);
// 				info2.slice(5, 7);

// 				$.each(info2, function(index, linkset) {
// 					$.each(linkset, function(index, set) {

// 						$.each(set, function(index, contents) {
// 							$.each(contents, function(index, espn_links) {
// 								$('<a class="espn-links" href=' + espn_links + '><span class="hideme">' + espn_links + '</span>' + team_name + ' on ESPN</a>').appendTo('.team-feed nav');
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

var my_team = $('.my-team').text();
var cap = 4;

//GET NEWS

function find_news() {
	$.ajax({
		url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/headlines/',
		data: {
			apikey: "4u3e6enmscdszh8qcy9dh7my",
			_accept: "application/json",
			limit: 5
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
		});
		$('#js-headlines article:first').appendTo("#js-headlines-latest");
	});
}

$("#banner").on("click", ".news-trigger", function(e) {
	e.preventDefault();
	$('a.credits').fadeToggle();
	$('#js-headlines').slideToggle('slow', function() {});
});

function switch_leagues() {
	$('.js-tabs').cycle({
		manualSpeed: 100
	});
}

function filter_schedule() {

	//hardcoded for demo purposes, as MLS reg season is over and would leave empty block. 

	//var today = moment().format("MM-DD-YYYY");
	var today = "10-20-2013";

	// check MLS schedule
	$('.single-game').each(function() {

		//removes day of week for calc.	
		var game_date = moment($(this).children('.game-date').text()).format("MM-DD-YYYY");

		if (game_date < today) {
			var removable = $("#game-previews * .single-game:contains('" + my_team + "')").css('display', 'block');
			$(removable).remove();
		} else if (game_date >= today) {

			//display ALL games that have my team
			$(".single-game:contains('" + my_team + "')").css('display', 'block');

			//add upcoming games
			$(this).filter(":contains('" + my_team + "')").appendTo("#upcoming-games");

			//grab the first from upcoming games
			var single_game = $('#game-previews * .single-game:first');

			//limits returned results (NEED TO ADD USER OPTION TO CHANGE CAP)			
			$('#upcoming-games').children().slice(cap);

			//add NEXT game from upcoming
			$(single_game).filter(":contains('" + my_team + "')").prependTo('#next-game');

			var next_game = $(single_game).filter(":contains('" + my_team + "')").prependTo('#next-game');

			//additional, if today is gameday, displays the trigger and/or auto display the modal
			if ($(next_game).children('.game-date').text() == today) {
				$('.gameday-trigger').css('display', 'block');
			}
		}

		// id game type
		var game_type = $(this).children('.game-competition').text();
		switch (game_type) {

			case "MLS Regular Season":
				$(this).addClass('type-mls-reg');
				break;
			case "MLS Playoffs":
				$(this).addClass('type-mls-playoffs');
				break;
			case "MLS Cup":
				$(this).addClass('type-mls-playoffs');
				break;
			case "CCL":
				$(this).addClass('type-ccl');
				break;
			case "US Open Cup":
				$(this).addClass('type-natl-us');
				break;
			case "Canadian Championship":
				$(this).addClass('type-natl-can');
				break;
			default:
				$(this).addClass('type-other');
		}
		// finally id the next game
		$(single_game).addClass('js-next-game').removeClass('type-mls-reg'); //remove ALL classes that control

	})

	$(".schedule-trigger").hover(function() {
		$('#upcoming-games').delay( 500 ).slideToggle('slow', function() {test();});
		$('#controls').fadeToggle('slow').click(function() {
			alert('clicking this will run code that controls how many results displayed');
			$(this).css('color', 'red');
		});
	});
}

function game_fields() {
	if (($('a.game-matchcenter') || $('a.game-tickets')).empty()) {
		$(this).css('display', 'none');
	}
}

// ON CLICK

function sorting() {
	//conditional display of tabs, depending on various situations
	$("li.type-all").click(function() {
		$("section#schedule-results * .single-game:contains('" + my_team + "')").show();
	});

	$("li.type-mls-reg").click(function() {
		$("section#schedule-results * .single-game.type-mls-reg:contains('" + my_team + "')").show();
		$("section#schedule-results * .single-game:contains('" + my_team + "'):not('.type-mls-reg')").hide();
	});

	$("li.type-mls-playoffs").click(function() {
		$("section#schedule-results * .single-game.type-mls-playoffs:contains('" + my_team + "')").show();
		$("section#schedule-results * .single-game:contains('" + my_team + "'):not('.type-mls-playoffs')").hide();
	});



	$("li.type-ccl").click(function() {
		$("section#schedule-results * .single-game.type-ccl:contains('" + my_team + "')").show();
		$("section#schedule-results * .single-game:contains('" + my_team + "'):not('.type-ccl')").hide();
	});

	$("li.type-natl-us").click(function() {
		$("section#schedule-results * .single-game.type-natl-us:contains('" + my_team + "')").show();
		$("section#schedule-results * .single-game:contains('" + my_team + "'):not('.type-natl-us')").hide();
	});

	$("li.type-natl-can").click(function() {
		$("section#schedule-results * .single-game.type-natl-can:contains('" + my_team + "')").show();
		$("section#schedule-results * .single-game:contains('" + my_team + "'):not('.type-natl-can')").hide();
	});
}

//triggers
$(".gameday-trigger").click(function() {
	$('#js-gameday').toggle();
});

var nbcsn = "NBCSN";
var ch_nbcsn = nbcsn.match(/NBCSN/g);

var nbc = "NBC";
var ch_nbc = nbc.match(/NBC/g);

var bein = "BEIN SPORT";
var ch_bein = bein.match(/BEIN SPORT/g);

var espn = "ESPN";
var ch_espn = espn.match(/ESPN/g);

var mls = "MLS LIVE";
var ch_mls = mls.match(/MLS LIVE/g);

$('a.game-tv:contains("' + ch_nbcsn + '")').filter(function() {
	return $(this).text();
}).attr("href", "http://www.nbcsports.com/tv-listings");

// $('a.game-tv:contains("'+ch_nbc+'")').filter(function() { 
// 	return $(this).text();
// }).attr("href","http://www.nbc.com");

$('a.game-tv:contains("' + ch_bein + '")').filter(function() {
	return $(this).text();
}).attr("href", "http://www.beinsport.tv");

$('a.game-tv:contains("' + ch_mls + '")').filter(function() {
	return $(this).text();
}).attr("href", "https://live.mlssoccer.com/");

$('a.game-tv:contains("' + ch_espn + '")').filter(function() {
	return $(this).text();
}).attr("href", "http://espn.go.com/watchespn/index");

$('a.game-tv:contains("MLS LIVETSNRDS2")').removeAttr('href').css('background', 'none');


// ON LOAD...
$(function() {
	location_based_view();
	//find_team_info();
	find_news();
	switch_leagues();
	filter_schedule();
	game_fields();
	sorting();
});