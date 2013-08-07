var source = 'http://api.espn.com/v1/sports/soccer/usa.1/teams/?apikey=4u3e6enmscdszh8qcy9dh7my';
// var city = $('.current-user-city').text();
function espn_find_leagues(){
	$.ajax({
		url: source,
		dataType: "json",
		beforeSend: function(xhr){
       xhr.setRequestHeader("Accept","application/json");},
		cache: false,
		type:"get"
	}).done(function(data){
			var results = data;
			console.log(results);
			results = JSON.stringify(results);
			$("<div></div>").append(results);
			$("<div>"+ results + "</div>").appendTo("#my-leagues").html();
		});
}

//DOM events

function youtube_find_channel(){
//method to find a specific teams's channel. should i make this dependent on the ESPN api? 
}

//DOM events
$(function() {
	espn_find_leagues();
	youtube_find_channel();
});