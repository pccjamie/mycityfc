google.load('search', '1');

var imageSearch;

function searchComplete() {

  // Check that we got results
  if (imageSearch.results && imageSearch.results.length > 0) {

    // Grab our content div, clear it.
    var contentDiv = document.getElementById('body');
    //verifying i can change body attr
    $('body').css('background-color','lime');

    // Loop through our results, printing them to the page. 
    var results = imageSearch.results;
    // newImg.src = "/image-search/v1/result.url;";
      // Put our title + image in the content
      // contentDiv.appendChild(imgContainer);
    var image = results[Math.floor(Math.random() * results.length)];
    var url = image.src = "/image-search/v1/result.url;";
    $('body').removeClass('bg-fan-profiles').css('background-image','url('+ url +')');
  }
}


function OnLoad() {

  // Create an Image Search instance.
  imageSearch = new google.search.ImageSearch();

  // Set searchComplete as the callback function when a search is 
  // complete.  The imageSearch object will have results in it.
  imageSearch.setSearchCompleteCallback(this, searchComplete, null);

  // Find me a beautiful car.
  imageSearch.execute("Seattle Mariners");

  // Include the required Google branding
  // google.search.Search.getBranding('branding');
}
google.setOnLoadCallback(OnLoad);

$(function (){

  OnLoad();

});