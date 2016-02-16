var React = require('react');
var ReactDOM = require('react-dom');

var Tabs = React.createClass({
  getInitialState: function() {
    return {selectedTab: 2};
  },

  selectCallback: function(idx, event){
    this.setState({selectedTab: idx }) ;
  },

  boldSelected: function(tab, idx) {
    if (this.props.tabArray[this.state.selectedTab] === tab){
      return (<li key={idx}><strong>  {tab.title}  </strong></li>);
    } else {
      return (<li key={idx}><button onClick={this.selectCallback.bind(this, idx)}>{tab.title}</button></li>);
    }
  },



  render: function() {
    var selectedArticleContetnt = this.props.tabArray[this.state.selectedTab].content;
    return(
      <div>
        <ul>
          {
          this.props.tabArray.map(function(tab, idx){
            return this.boldSelected(tab, idx);
          }.bind(this))
          }
        </ul>
        <article>
          {selectedArticleContetnt}
        </article>
      </div>
    );
  }

});

module.exports = Tabs;
