// var city = $('li.current-user-city').html();
// var city = city.toLowerCase();
var city = 'houston';
var espn = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/';

//GET TEAM ID
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
		$.each(data.sports[0].leagues[0].teams, function(index, team) {
					team_id = team.id;
					return this;
			});	return;
	});


// GET INFO
function find_team_info() {

	var espn_links;

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
			
			console.log(team_id);
		$.each(data.sports[0].leagues[0].teams, function(index, team) {

			var team_name = team.name.toLowerCase();
			var team_location = team.location.toLowerCase();
			var team_id = team.id;
			
		// $('#my-teams * .team-feed header').append("<div class=feed-data>" + team_location + "</div>");
		// $("#my-teams * .feed-data:contains('" + city + "')").css("display", "block");
			$.each(team, function(index, info) {
				
				info2 = $(info);
				info2.slice(5, 7);

				$.each(info2, function(index, linkset) {
					$.each(linkset, function(index, set) {

						$.each(set, function(index, contents) {
							$.each(contents, function(index, espn_links) {
								$('<a class="espn-links" href='+espn_links+'><span class="hideme">'+espn_links+'</span>'+ team_name +' on ESPN</a>').appendTo('.team-feed nav');
								$("#my-teams * a:contains('usa.1')").remove();
								$("#my-teams * a:contains('" + city + "')").css("display", "block");
								$("#my-teams * br").remove();
							});
						});
					});
				});
			});
		});
	});
	return;
}


//GET NEWS
function espn_find_news() {
	$.ajax({
		url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/headlines/',
		data: {
			apikey: "4u3e6enmscdszh8qcy9dh7my",
			_accept: "application/json",
			limit: 2
		},
		dataType: "jsonp",
		beforeSend: function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
		},
		cache: false,
		type: "get"
	}).done(function(data) {

		$.each(data.headlines, function(index, article) {
		
			$('#my-news .sleeve').append("<article><h5><a href="+article.links.web.href+">"+article.title+"</a></h5> </article>");
			// $('#my-news .sleeve article').append("<div class=images>" + article.images+"</div>");
			console.log(article.categories);
					
					// $.each(article.categories, function(index, category) {
										
					// 					// console.log(category);
					// 					var cat = category;
										
					// 					$(cat);

					// 					$(cat).attr('class','cat');
					// 					// console.log($('.cat'));
					// 					$("#my-news * .cat:contains('" + team_id + "')").css("display", "block");
					// 					return this;

					// });
			
		});
	});
}

function league_slider(){

$('.leagueslider').cycle({
    manualSpeed: 100
});
}

function location_switch(){
	var bg = $('.team-venue-image:first').text();
	$('body').css('background-image','url('+bg+')');
	$('.team:first').addClass('primary');
	$('.team:first').after('<h5>Other teams near you</h5><br/>').nextAll().addClass('secondary').remove('.team-links');
}


// ON LOAD
$(function() {
	find_team_info();
	location_switch();
	espn_find_news();
	league_slider();

});