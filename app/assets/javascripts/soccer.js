var url = 'http://api.espn.com/v1/sports/soccer/usa.1/?apikey=4u3e6enmscdszh8qcy9dh7my';
//send users city
// var city = $('.current-user-city').text();
function espn_find_leagues(){
	console.log('here i am');
	$.ajax({
		dataType: "json",
		cache: false,
		type: "GET",
		url: url,
		success: function(json) {
			console.log(json);
			var my_data = json;
			console.log(my_data);
			$("<div>"+ my_data + "</div>").appendTo("#my-leagues");
		}
	});
}

//DOM events
$(function(){
	espn_find_leagues();
});