//sets background based on user's current location.

//switch from flickr to google image

var search;
var i;
var leagues;
var league;
var city = $('.current-user-city').text();

// searches espn with a
function espn_find_leagues(){

  // search = $('#search').val();

	console.log('My city is: ' + city);
	console.log('finding leagues');
	var url = 'http://api.espn.com/v1/sports/soccer/usa.1/?apikey=4u3e6enmscdszh8qcy9dh7my';
	var cache = false;
	$.getJSON(
		url,
		cache,
		function(data){
		console.log(data);
		console.log('inside the AJAX calls. Should be returning league data');
	}).done(add_to_page);
}

// add the league info to the page
function add_to_page(){
	console.log('adding to DOM');
//    for(var i = 0; i<gallery.length; i++){
//     // $('body').css('background','red');
//     add_photo(i);
//   }
//     // var id = $(this).attr("src");
//     // $('body').css('background-image','url("' + id + '")'); 
}

// // add new div for single photo for each from parsed list. gets a parameter, which looks to be the index value of the pic in flickr.

// function add_photo(i){    
//     var single_image = $('<img>').addClass('single-image');
//     single_image.attr('src', get_photo_src(i));
//      $('#photo-bag').append(single_image);
//      console.log('now setting background image!')
//     $('body').css('background-image','url(' + single_image.attr('src') + ')');

// }

// function get_photo_src(index){
//   var photo = gallery[index];
//   var src = "http://farm"+ photo.farm +".static.flickr.com/"+ photo.server +"/"+ photo.id +"_"+ photo.secret +"_m.jpg";
//   return src;


// DOM events
$(function(){
  espn_find_leagues();
});










