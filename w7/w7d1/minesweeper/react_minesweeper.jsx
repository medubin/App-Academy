var React = require('react');
var ReactDOM = require('react-dom');
var Game = require('./components/game');

var MineSweeper = React.createClass({
  render: function () {
    return(
      <div>
        <Game />
      </div>
    );
  }
});

document.addEventListener("DOMContentLoaded", function () {
  ReactDOM.render(<MineSweeper />, document.getElementById('minesweeper'));
});
