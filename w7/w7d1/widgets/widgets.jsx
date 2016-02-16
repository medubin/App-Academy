var React = require('react');
var ReactDOM = require('react-dom');
var Tabs = require('./tabs');
var Clock = require('./clock');
var Weather = require('./weather');
var AutoComplete = require('./autocomplete');

var tabArray = [
  {title: 'friends', content: 'Cats and Dogs'},
  {title: 'Cats', content: 'Gizmo, Breakfast'},
  {title: 'Dogs', content: 'Roofus, Copper'}];
var wordArray = ['computer', 'chair', 'chin', 'hair', 'copper'];

var Widget = React.createClass({
  render: function () {
    return(
      <div>
        <h1>Widgets</h1>
        <h2>Tabs:</h2>
        <Tabs tabArray={tabArray}/>
        <h2>Clock:</h2>
        <Clock />
        <h2>Weather:</h2>
        <Weather/>
        <h2>AutoComplete:</h2>
        <AutoComplete wordArray={wordArray}/>
      </div>
    );
  }
});

document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(<Widget />, document.getElementById('widget'));
});
