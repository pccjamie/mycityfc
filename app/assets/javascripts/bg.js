	//sets background based on user's current location.
	var search;
	var per_page = 1;
	var gallery;
	var i;
	var single_image;
	// searches flicker

	function search_flickr() {

		// search = $('#search').val();

		// search = $('.current-user-city').text();
		var search = ""+city+"soccer";

		var url = 'http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=4c6e1f137bbeb666a1c0a884b609e286&secret=18afd75339612a5c&text=' + search + '&per_page=' + per_page + '&format=json&jsoncallback=?';
		var cache = false;
		$.getJSON(
			url,
			cache,
			function(data) {
				gallery = data.photos.photo;
				console.log('Im inside the AJAX calls. Should be returning a photo based on city');
				// ugly cache fix     
			}
		).done(add_photo_album);
	}

	//Loops and adds each photo in the returned photos

	function add_photo_album() {

		for (var i = 0; i < gallery.length; i++) {
			// $('body').css('background','red');
			add_photo(i);
		}
		// var id = $(this).attr("src");
		// $('body').css('background-image','url("' + id + '")'); 
	}

	// add new div for single photo for each from parsed list. gets a parameter, which looks to be the index value of the pic in flickr.

	function add_photo(i) {
		var single_image = $('<img>').addClass('single-image');
		single_image.attr('src', get_photo_src(i));
		$('#photo-bag').append(single_image);
		console.log('now setting background image!')
		$('body').css('background-image', 'url(' + single_image.attr('src') + ')');

	}

	function get_photo_src(index) {
		var photo = gallery[index];
		var src = "http://farm" + photo.farm + ".static.flickr.com/" + photo.server + "/" + photo.id + "_" + photo.secret + "_m.jpg";
		return src;
	}

	// function delayed_load(){
	//   setInterval(add_photo[i], 1000)
	// }

	// DOM events
	$(function() {
		$('body').css('background-image', 'none');
		search_flickr();
	});