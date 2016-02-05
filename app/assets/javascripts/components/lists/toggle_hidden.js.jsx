var ToggleHidden = React.createClass({
  onClick: function () {
    this.props.parent.toggleHidden();
  },
  
  render: function() {
    var hideCompleted = this.props.hideCompleted;
    var buttonText = hideCompleted ? "Show" : "Hide";
    buttonText = buttonText + " Completed Items";
    
    return (
      <div>
        <input type="button" value={buttonText} onClick={this.onClick} /> 
      </div>
    );
  }
});