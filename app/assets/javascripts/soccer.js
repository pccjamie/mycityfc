var url = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/' + city + '/?apikey=4u3e6enmscdszh8qcy9dh7my';
var city = $('.current-user-city').text();

function espn_find_leagues() {
	$.ajax({
		dataType: "JSON",
		cache: false,
		type: "GET",
		url: url,
		success: function(data) {
			var results = data;
			console.log(results);
			results = JSON.stringify(results);
			console.log(city);
			local_results = $(results).find(city);
			$("<div></div>").append(local_results);
			// $("#my-leagues").append(results);
			$("<div>" + local_results + "</div>").appendTo("#my-leagues").html();
		}
	});
}
//DOM events
$(function() {
	espn_find_leagues();
});