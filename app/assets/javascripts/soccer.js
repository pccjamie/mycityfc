var city = $('li.current-user-city').html();
var city = city.toLowerCase();
var i = 0;

// GET FIND YOUR TEAM
function espn_find_team() {
	var source_teams = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/';
	// console.log('entered function - espn find team');	
	$.ajax({
		url: source_teams,
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
			// console.log(index + ': ' + team.location + '-' + team.name);
			var click;
			
		
		$('#my-teams * header').append("<div class=team>" + team.location + ' ' + team.name + "</div>");

		$("#my-teams * .team:contains('"+city+"')").css("display","block" );


		});
	});
}

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

		$.each(data.sports[0].leagues[0].teams, function(index, team) {

			$.each(team, function(index, info) {
				
				info2 = $(info);
				info2.slice(5, 7);
				$.each(info2, function(index, linkset) {
					$.each(linkset, function(index, set) {
						// console.log(set);
						$.each(set, function(index, contents) {
							$.each(contents, function(index, espn_links) {


							$('<a class="team-link" href='+espn_links+'>'+ espn_links +'</a>').appendTo('#my-teams * nav');
		
							$("#my-teams * a:contains('usa.1')").remove();
							$("#my-teams * a:contains('"+city+"')").css("display","block" );
					
						
					
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
				url: 'http://api.espn.com/v1/sports/soccer/usa.1/news/',
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
				raw = data;
				// $.each(raw.headlines[0].categories[2], function(index, team) {
				// console.log('This team has a headline: ' + team.headline);

				$.each(raw.headlines, function(index, team) {
					var info = [raw.headlines];
					// var info = [raw.headlines[0].categories[2].teams];
					var test = $(this).attr("class", "team-headline");
					$('#my-news .sleeve').append("<div class=team-headline>" + this.headline + "</div>");
				});
			});
		}

		// ON LOAD
		$(function() {
			//espn_find_team();
			find_team_info();
			espn_find_news();
		});