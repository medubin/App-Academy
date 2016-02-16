var React = require('react');
var ReactDOM = require('react-dom');

var Clock = React.createClass({

  getInitialState: function () {
    return {time: new Date()};
  },

  render: function () {
    return(
      <h3>
        {this.state.time.toString()}
      </h3>
    );
  },

  componentDidMount: function() {
    // var setInterval
    var setIntervalId = setInterval(function() {
      this.setState({time: new Date()});
    }.bind(this), 1000);
  },

  componentWillUnmount: function() {
    var setIntervalId = undefined;
  }
});


module.exports = Clock;
