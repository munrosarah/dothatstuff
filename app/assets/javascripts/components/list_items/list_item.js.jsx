var ListItem = React.createClass({
  getInitialState(){
    return { completed: this.props.list_item.completed };
  },

  onChange: function () {
    var isCompleted = this.state.completed;
    $.ajax({
      url: '/list_items/' + this.props.list_item.id + '/toggle_completed',
      type: 'POST',
      data: { "completed": !isCompleted },
      context: this,
      success: function(result) {
        this.setState({completed: !isCompleted});
      },
    });
  },

  render: function() {
    var todoClass = this.state.completed ? 'done' : 'todo';
    var todoItem;
    
    if(!this.props.hideCompleted || !this.state.completed){
      todoItem = (<li className={todoClass}>
                    <input
                      type="checkbox"
                      checked={this.state.completed}
                      onChange={this.onChange} />
                    <div className="to-do-item">
                      {this.props.list_item.description}
                    </div>
                  </li>);
    } 

    return (
      <div>
        {todoItem}   
      </div>
    );
  }
});