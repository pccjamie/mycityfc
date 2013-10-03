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
	//$('body').css('background-image', 'url(' + bg + ')');
	$('#js-schedule').css('background-color', 'rgba(0,0,0,.60)');
	//$('#js-match-day').css('background-image', 'url(' + bg + ')');
	$('.team:first').addClass('primary');
	$('.team:first').after('<h5>A little farther away...</h5><div class="clearfix"></div>').nextAll().addClass('secondary');
}

// function filter_games() {
// 	//retrive user's preferred team from DOM text.
	
// 	// if (valid_game) {
// 	//  	$(this).css("display", "block");
// 	// 	//ensuring this occurs before further action.
// 	// 	//setTimeout(afterCss, 10);
// 	// }
// 	//passing this to the 
// 	show_next_game();
// }

	var my_team = $('.my-team').text();


function filter_schedule() {

	var today = moment().format("MM-DD-YYYY");

	//var valid_game = 

	// check MLS schedule
	$('.single-game').each(function() {

		//var game = $(this);
		//removes day of week for calc.	
		var game_date = moment($(this).children('.game-date').text()).format("MM-DD-YYYY");

		if (game_date < today) {

			//console.log("Before today: "+game_date);//game_date = "10-01-2013";
			var removable = $("#game-previews * .single-game:contains('" + my_team + "')").css('display','block');
			$(removable).remove();		
			//$(this).css('display', 'none');
		} 

		else if (game_date >= today) {

			//display ALL games that have my team
			$(".single-game:contains('" + my_team + "')").css('display','block');

			// dont remember why i had this at the moment, just keep for now.
			//$(this).css({'color': '#363636'}).children('.game-score').css('display','none');

			//$(this):contains("'+ my_team +'")).parent().first().appendTo(".game-summary").css('display','block');
			
			//add to upcoming games (NEED TO ACCOUNT FOR HAVING A HUGE LIST AT BEG OF MO)
			$(this).filter(":contains('"+my_team+"')").appendTo("#upcoming-games");
		
			//grab the first from upcoming games
			var single_game = $('#game-previews * .single-game:first');
			
			var game_limit = 2;
			$('#upcoming-games').children().slice(game_limit).hide();

			//add to...
			$(single_game).filter(":contains('"+my_team+"')").prependTo('#next-game');

			//NEED TO LIMIT RESULTS TO XXXX 

			//additional, if today is gameday, displays the trigger and/or auto display the modal
			if (game_date == today) {
				$('.gameday-trigger').css('display', 'block');
			}

		}

		//sorts games
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
				// case "Friendly":
				// 	$(this).addClass('type-friendly');
				// 	break;
			default:
				$(this).addClass('type-unknown');
		}

		$(single_game).addClass('js-next-game').removeClass('type-mls-reg');

	})

	

}

function game_fields() {
	if (($('a.game-matchcenter') || $('a.game-tickets')).empty()) {
		$(this).css('display', 'none');
	}

	//channels

}

// ON CLICK

function sorting(){
$("ul.competitions li.type-ccl").click(function(){
});
}


$(".gameday-trigger").click(function() {
	$('#js-gameday').toggle();
});


$(".schedule-trigger").click(function() {
	$('#upcoming-games').slideToggle('500', function() {});
});




// var tv1 = $(/MLS LIVE/);
// var tv2 =/NBCSN/;
// var tv3 =/NBC/;
	var tv4 = /ESPN/;

// var tv5 =/BEIN SPORT/;
// var tv6 =/UNIMAS/;
// var tv7 =/TSN/;

// $('a.game-tv').filter(function() { 
// 	return $(this).text() === $(/MLS LIVE/);
// }).attr("href","http://www.mlssoccer.com/liveeso");

// $('a.game-tv').filter(function() { 
// 	return $(this).text() === $(tv2);
// }).attr("href","http://www.nbcsports.com/tv-listings");

// $('a.game-tv').filter(function() { 
// 	return $.trim($(this).text() === /ESPN/i);
// }).attr("href","http://espn.go.com/watchespn/index");

// $('a.game-tv').filter(function() { 
// 	return $(this).text() === $(/TSN/);
// }).attr("href","http://www.tsn.ca/");

// $('a.game-tv').filter(function() { 
// 	return $(this).text() === $(/BEIN SPORT/);
// }).attr("href","http://www.beinsport.tv/");

// $('a.game-tv').filter(function() { 
// 	return $(this).text() === $(/UNIMAS/);
// }).attr("href","http://tv.univision.com/unimas/");


// ON LOAD...
$(function() {
	location_based_view();
	//find_team_info();
	//find_news();
	//switch_leagues();
	filter_schedule();
	game_fields();
	sorting();	
});