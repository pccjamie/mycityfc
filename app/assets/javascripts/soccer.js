var city = $('li.current-user-city').html();
//var city = city.toLowerCase();
var city = 'new';
var i = 0;

// GET INFO

function find_team_info() {
	var espn = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/links/web/';
	// console.log('entered function - espn find team');
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
			console.log(data.sports[0].leagues[0].name);
			console.log($(this).parent(name));
		$.each(data.sports[0].leagues[0].teams, function(index, team) {
			var team_name = team.name.toLowerCase();
			var team_location = team.location.toLowerCase();
			console.log(team.id);
		$('#my-teams * header').append("<div class=team>" + team_location +  "</div>");
		$("#my-teams * .team:contains('" + city + "')").css("display", "block");
			$.each(team, function(index, info) {
				info2 = $(info);
				info2.slice(5, 7);
				$.each(info2, function(index, linkset) {
					$.each(linkset, function(index, set) {
						// console.log(set);
						$.each(set, function(index, contents) {
							$.each(contents, function(index, espn_links) {
								$('<a class="team-link" href=' + espn_links + '><span class="hideme">'+espn_links+'</span>Visit the '+team_name +' on ESPN</a>').appendTo('#my-teams * nav');
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

// console.log(city);

//GET NEWS
function espn_find_news() {
	$.ajax({
		url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/headlines/',
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

		$.each(data.headlines, function(index, article) {
		
			$('#my-news .sleeve').append("<article><h4><a href="+article.links.web.href+">"+article.title+"</a></h4> </article>");
			// $('#my-news .sleeve article').append("<div class=images>" + article.images+"</div>");
			console.log()
			// $.each(article, function(index,categories){
			// 		// $.each(categories, function(index,teams){
			// 		// 		$('#my-news .sleeve article').append("<span class=team>"+article.links.web.href+">"+article.title+"</a></h4> </article>");
			// 		// });
			// });

			// $('#my-news .sleeve article').append(article.categories);

	

			// });
		});
	});
}
// ON LOAD
$(function() {
	find_team_info();
	espn_find_news();
});