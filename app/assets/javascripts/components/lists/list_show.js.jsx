var ListShow = React.createClass({
  getInitialState(){
    return {hideCompleted: this.props.list.hide_completed};
  },

  toggleHidden: function(){
    var hideCompleted = this.state.hideCompleted;
    $.ajax({
      url: '/lists/' + this.props.list.id + '/toggle_hidden',
      type: 'POST',
      data: { "hide_completed": !hideCompleted },
      context: this,
      success: function(result) {
        this.setState({hideCompleted: !hideCompleted});
      },
    });
  },

  render: function() {
    var hideCompleted = this.state.hideCompleted;
    var listItems = this.props.list_items.map(function (list_item) { 
      return <ListItem list_item={list_item} key={list_item.id} hideCompleted={hideCompleted} /> });

    return (
      <div className="toDoList">
        <h1>{this.props.list.title}</h1>
        <ToggleHidden parent={this} hideCompleted={hideCompleted}/>
        <ul> 
          {listItems}         
        </ul>
        <ListItemNew list_id={this.props.list.id} />
      </div>      
    );
  }
});