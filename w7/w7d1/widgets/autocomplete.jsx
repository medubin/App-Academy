var React = require('react');
var ReactDOM = require('react-dom');

var AutoComplete = React.createClass({
  getInitialState: function() {
    return({wordPartial: ''});
  },

  generateList: function() {
    var matches = [];
    this.props.wordArray.forEach(function(possibleMatch){
      if (possibleMatch.indexOf(this.state.wordPartial) !== -1 && this.state.wordPartial.length > 0) {
        matches.push(<li onClick={this.setPartial}>{possibleMatch}</li>);
      }
    }.bind(this));
    return matches;
  },

  render: function() {
    return(
      <root>
        <input id="input" type="text" onKeyUp={this.updatePartial}></input>
        <ul>
          {this.generateList()}
        </ul>
      </root>
    );
  },

  updatePartial: function(e) {
    this.setState({wordPartial: e.currentTarget.value});
  },

  setPartial: function(e) {
    this.setState({wordPartial: e.currentTarget.innerHTML});
    document.getElementById("input").value = e.currentTarget.innerHTML;
  }

});

module.exports = AutoComplete;
