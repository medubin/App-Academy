$.ajax({
  type: 'get',
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success: function(poodle) {
    console.log("We have your weather!");
    console.log(poodle);
  },
  error: function() {
    console.error("An error occured.");
  },
});

  console.log('hello from your console');
