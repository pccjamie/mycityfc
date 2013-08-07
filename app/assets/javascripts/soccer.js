// var city = $('.current-user-city').text();
var url = 'http://api.espn.com/v1/sports/soccer/usa.1/?apikey=4u3e6enmscdszh8qcy9dh7my';
function espn_find_leagues(){
	console.log('here i am');
	$.ajax({
		dataType: "json",
		url: url,
		data: data,
		success: function(data) {
			console.log(data);
			var my_data = data;
			$('#my-leagues').append(my_data);
		}
	});
}

//DOM events
$(function(){
	espn_find_leagues();
});