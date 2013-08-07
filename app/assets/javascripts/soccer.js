// var city = $('.current-user-city').text();
function espn_find_leagues(){
  
  $.ajax({
	   url: 'http://api.espn.com/v1/sports/soccer/usa.1/?apikey=4u3e6enmscdszh8qcy9dh7my';
	   cache: false;
	   dataType: json;
	   data: data;
	   success: function(data){
			$('#my-leagues').append(data)
			}
		})
}
//DOM events
$(function(){
	espn_find_leagues();
});