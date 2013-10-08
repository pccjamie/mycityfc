//var city = $('li.current-user-city').html();
//var city = city.toLowerCase();
var city = 'New York';
var espn = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/';

if(window.location.href.indexOf("fan") > -1) {
	$('body').addClass('bg-fan-profiles');
	}
	if(window.location.href.indexOf("parent") > -1) {
	$('body').addClass('bg-parent-profiles');
	}
	if (window.location.href.indexOf("slides") > -1) {
		$('body').addClass('bg-slides').removeClass('bg-default');
	} else {
		$('body').removedClass('bg-default');
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



var my_team = $('.my-team').text();
var cap = 2;

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
		});
			$('#js-headlines article:first').appendTo("#js-headlines-latest");
	});

}

$("#banner").on("click", ".news-trigger", function(e) {
	e.preventDefault();

		$('a.credits').fadeToggle();
		$('#js-headlines').slideToggle('slow', function(){
			// ("#js-headlines article:first").nextAll().css('display', 'block');
		});

});

function switch_leagues() {
	$('.js-tabs').cycle({
		manualSpeed: 100
	});
}

//change BG based on closest team

function location_based_view() {
	//if no primary team, use background for team closest
	//var bg = $('.team-venue-image:first').text();
	//else use background for team chosen
	//$('body').css('background-image', 'url(' + bg + ')');

	
	$('#js-schedule').css('background-color', 'rgba(0,0,0,.60)');
	$('.team:first').addClass('primary');
	$('.team:first').after('<h5>A little farther away...</h5><div class="clearfix"></div>').nextAll().addClass('secondary');
}

function filter_schedule() {

	var today = moment().format("MM-DD-YYYY");

	// check MLS schedule
	$('.single-game').each(function() {

		//var game = $(this);
		//removes day of week for calc.	
		var game_date = moment($(this).children('.game-date').text()).format("MM-DD-YYYY");

		if (game_date < today) {
			var removable = $("#game-previews * .single-game:contains('" + my_team + "')").css('display','block');
			$(removable).remove();		
		} 

		else if (game_date >= today) {

			//display ALL games that have my team
			$(".single-game:contains('" + my_team + "')").css('display','block');

			//$(this):contains("'+ my_team +'")).parent().first().appendTo(".game-summary").css('display','block');
			
			//add to upcoming games (NEED TO ACCOUNT FOR HAVING A HUGE LIST AT BEG OF MO)
			$(this).filter(":contains('"+my_team+"')").appendTo("#upcoming-games");
		
			//grab the first from upcoming games
			var single_game = $('#game-previews * .single-game:first');

			//limits returned results (NEED TO ADD USER OPTION TO CHANGE CAP)			
			$('#upcoming-games').children().slice(cap);

			//add to next game
			$(single_game).filter(":contains('"+my_team+"')").prependTo('#next-game');

			//NEED TO LIMIT RESULTS TO XXXX 
			//additional, if today is gameday, displays the trigger and/or auto display the modal
			if (game_date == today) {
				$('.gameday-trigger').css('display', 'block');
			}
		}

		// id game type
		var game_type = $(this).children('.game-competition').text();
		switch (game_type) {

			case "MLS Regular Season":
				$(this).addClass('type-mls-reg');
				break;
			case "CCL":
				$(this).addClass('type-ccl');
				break;
			case "Open Cup":
				$(this).addClass('type-open');
				break;
			default:
				$(this).addClass('type-unknown');
		}

		// finally id the next game
		$(single_game).addClass('js-next-game').removeClass('type-mls-reg');
	})
	$(".schedule-trigger").click(function() {
	$('#upcoming-games').slideToggle('slow', function() {
	});
	
	$('#controls').fadeToggle('slow').click(function(){
		alert('clicking this will run code that controls how many results displayed');
		$(this).css('color','red');
	});
});
}

function game_fields() {
	if (($('a.game-matchcenter') || $('a.game-tickets')).empty()) {
		$(this).css('display', 'none');
	}
	//channels
}

// ON CLICK
function sorting(){

//conditional display of tabs, depending on various situations
$("li.type-all").click(function(){

	$("section#schedule-results * .single-game:contains('"+my_team"')").show();

});

$("li.type-mls-reg").click(function(){

	$("section#schedule-results * .single-game.type-mls-reg:contains('New York')").show();
	$("section#schedule-results * .single-game:contains('New York'):not('.type-mls-reg')").hide();

});


$("li.type-ccl").click(function(){
	$("section#schedule-results * .single-game.type-ccl:contains('New York')").show();
	$("section#schedule-results * .single-game:contains('New York'):not('.type-ccl')").hide();
});

$("li.type-open").click(function(){
	$("section#schedule-results * .single-game.type-open:contains('New York')").show();
	$("section#schedule-results * .single-game:contains('New York'):not('.type-open')").hide();
});

}


//triggers
$(".gameday-trigger").click(function() {
	$('#js-gameday').toggle();
});

var nbcsn="NBCSN"; 
var ch_nbcsn=nbcsn.match(/NBCSN/g);

var nbc="NBC"; 
var ch_nbc=nbc.match(/NBC/g);

var bein= "BEIN SPORT"; 
var ch_bein=bein.match(/BEIN SPORT/g);

var espn="ESPN"; 
var ch_espn=espn.match(/ESPN/g);

var mls="MLS LIVE"; 
var ch_mls=mls.match(/MLS LIVE/g);

$('a.game-tv:contains("'+ch_nbcsn+'")').filter(function() { 
	return $(this).text();
}).attr("href","http://www.nbcsports.com/tv-listings");

// $('a.game-tv:contains("'+ch_nbc+'")').filter(function() { 
// 	return $(this).text();
// }).attr("href","http://www.nbc.com");

$('a.game-tv:contains("'+ch_bein+'")').filter(function() { 
	return $(this).text();
}).attr("href","http://www.beinsport.tv");

$('a.game-tv:contains("'+ch_mls+'")').filter(function() { 
	return $(this).text();
}).attr("href","https://live.mlssoccer.com/");

$('a.game-tv:contains("'+ch_espn+'")').filter(function() { 
	return $(this).text();
}).attr("href","http://espn.go.com/watchespn/index");

$('a.game-tv:contains("MLS LIVETSNRDS2")').removeAttr('href').css('background','none');


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