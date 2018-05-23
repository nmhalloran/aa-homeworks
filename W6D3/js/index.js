console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("We have your weather!");
    console.log(data);
  },
  error() {
    console.error("An error occurred.")
  },
});

console.log("whoah, AJAX works!");
// Add another console log here, outside your AJAX request


// It should be a GET request.
// It should get the New York weather from this url: http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=bcb83c4b54aee8418983c2aff3073b3b
// If the request fails, sign up for your own API key here and stick that key in place of bcb83c4b54aee8418983c2aff3073b3b.
// It should take a success callback
// In the success callback, console.log out what the weather is.
// Write another console.log at the bottom of the file (outside of the AJAX request). Your file should have this rough structure:
//
// console.log("Hello from the JavaScript console!");
//
// // your AJAX request
//     // --> including a console.log for the data in the success callback
//
// // another console.log down here
// Notice the order that the console.logs run.
//
// Make sure you can answer the following questions:
//
// When does the request get sent?
// When does the response come back?
// What's the current weather in New York?
// Did the page refresh?
// How could we use different HTTP methods in our request?
