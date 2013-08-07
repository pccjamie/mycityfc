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
			// local_results = $(results).find(city);
			$("<div></div>").append(results);
			local_result = $('div:contains('+city+')').parent();

			// $("#my-leagues").append(results);
			$("<div>" + local_result + "</div>").appendTo("#my-leagues").text();




		}
	});
}

function youtube_find_channel(){

//method to find a specific teams's channel. should i make this dependent on the ESPN api? 

}

//DOM events
$(function() {
	espn_find_leagues();
	youtube_find_channel();
});