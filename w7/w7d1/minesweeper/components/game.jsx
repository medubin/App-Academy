var React = require('react');
var ReactDOM = require('react-dom');
var ReactBoard = require('./react-board');
var Board = require('../minesweeper').Board;

var Game = React.createClass({

  getInitialState: function(){
    return {board: new Board (10, 4)};
  },

  updateGame: function(){

  },

  render: function(){
    return(
      <Board board={this.state.board} updateGame={this.updateGame} />
    );
  }

});


module.exports = Game;
