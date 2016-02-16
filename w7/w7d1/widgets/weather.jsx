var React = require('react');
var ReactDOM = require('react-dom');


// api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}


var Weather = React.createClass({
   getWeather: function() {
     return navigator.geolocation.getCurrentPosition(function(pos) {

      var crd = pos.coords;
      this.setState({location:[crd.latitude, crd.longitude] });
      this.AjaxRequest();
    }.bind(this));
  },

  AjaxRequest: function() {

    var xmlhttp;
      xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE ) {
           if(xmlhttp.status == 200){
            var response = JSON.parse(xmlhttp.responseText);
             var rtemp = response.main.temp;
             var rweath = response.weather[0].main;
             this.setState({temp: rtemp, weather: rweath});
           }
           else if(xmlhttp.status == 400) {
             alert('There was an error 400');
           }
           else {
             alert('something else other than 200 was returned');
           }
        }
    }.bind(this);
    xmlhttp.open(
    "GET",
    "http://api.openweathermap.org/data/2.5/weather?lat=" + this.state.location[0] + "&lon=" + this.state.location[1] + "&appid=645c5d39c7603f17e23fcaffcea1a3c1",
    true
    );
    xmlhttp.send();
  },

  getInitialState: function() {
    return{location: "Loading...", temp: 'Loading...', weather: 'Loading..'};
  },

  render: function() {
    return (
      <div>
        {this.state.weather}
        {'\t'}
        {this.state.temp}
      </div>
    );
  },

  componentDidMount: function() {
    this.getWeather();
  }


});

module.exports = Weather;
