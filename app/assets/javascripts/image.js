// google.load('search', '1');

// // var remote = "https://www.google.com";

// $(location).attr('href');

// var imageSearch;

// function searchComplete() {

// // Grab our content div, clear it.
//           var contentDiv = document.getElementById('content');
//           contentDiv.innerHTML = '';

//           // all the results
//           var results = imageSearch.results;
//           result = results[Math.floor(Math.random() * results.length + 1)];
//           for (var i = 0; i < results.length; i++) {
//             // For each result write it's title and image to the screen
//             var result = results[i];
//             var imgContainer = document.createElement('div');
//             var title = document.createElement('div');

           
//             // We use titleNoFormatting so that no HTML tags are left in the 
//             // title
//             title.innerHTML = result.titleNoFormatting;
//             console.log(result.href);
//             var newImg = document.createElement('img');

//             // There is also a result.url property which has the escaped version
// 					console.log(newImg.src="/image-search/v1/result.url");

//             imgContainer.appendChild(title);
//             imgContainer.appendChild(newImg);

//             var source = newImg.src;
//             // Put our title + image in the content
//             contentDiv.appendChild(imgContainer);
//             console.log(contentDiv);
//             //and make it the body bg
//             $('body').css('background-image','none');
//             $('body').css('background-image', 'url('+ source +')');

//           }
//   }

// function OnLoad() {

//   // Create an Image Search instance.
//   imageSearch = new google.search.ImageSearch();

//   // Set searchComplete as the callback function when a search is 
//   // complete.  The imageSearch object will have results in it.
//   imageSearch.setSearchCompleteCallback(this, searchComplete, null);

//   // Find me a beautiful car.
//   imageSearch.execute("Seattle Sounders");

//   // Include the required Google branding
//   // google.search.Search.getBranding('branding');
// }
// google.setOnLoadCallback(OnLoad);

// $(function (){

//   OnLoad();

// });
