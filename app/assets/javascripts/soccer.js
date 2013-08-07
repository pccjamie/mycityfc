//sets background based on user's current location.

// var city = $('.current-user-city').text();

// searches espn with a
function espn_find_leagues(){

	var container = $('#my-leagues');
	var url = 'http://api.espn.com/v1/sports/soccer/usa.1/?apikey=4u3e6enmscdszh8qcy9dh7my';
	$.ajax({
	  url: url,
	  cache: false,
	  dataType: json;
	  data: data,
	  success: function(data) {
		console.log(data)	
	});
	// $.getJSON(
	// 	url,
	// 	cache,
	// 	function(data){
	// 	league_data = data;
	// 	console.log('inside the AJAX calls. Should be returning league data');
	// }).done(add_to_page);
}


// // add new div for single photo for each from parsed list. gets a parameter, which looks to be the index value of the pic in flickr.

// function add_photo(i){    
//     var single_image = $('<img>').addClass('single-image');
//     single_image.attr('src', get_photo_src(i));
//      $('#photo-bag').append(single_image);
//      console.log('now setting background image!')
//     $('body').css('background-image','url(' + single_image.attr('src') + ')');

// }


