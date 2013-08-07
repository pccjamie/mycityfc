var url = 'http://api.espn.com/v1/sports/soccer/usa.1/?apikey=4u3e6enmscdszh8qcy9dh7my';
//send users city
// var city = $('.current-user-city').text();
function espn_find_leagues(){
	console.log('here i am');
	$.ajax({
		dataType: "json",
		cache: false,
		// data = city,
		url: url,
		success: function(data) {
			console.log(data);
			var my_data = data;
			console.log($(my_data).text());
			$("#my-leagues").append($(this).text());
		}
	});
}

//DOM events
$(function(){
	espn_find_leagues();
});