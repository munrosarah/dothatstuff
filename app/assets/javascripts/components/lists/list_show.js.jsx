var ListShow = React.createClass({
  getInitialState(){
    return {hideCompleted: this.props.list.hide_completed, listItems: []};
  },

  componentDidMount: function () {
    this.loadListItems();
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
      }.bind(this),
    });
  },

  handleListItemSubmit: function (listItem) {
    $.ajax({
      url: '/list_items/create',
      dataType: 'json',
      type: 'POST',
      data: { "list_item": listItem },
      cache: false,
      complete: function(response) {
        var flashMessageEvent = 
          new CustomEvent("flashMessages",  { detail: { response: response }});
        dispatchEvent(flashMessageEvent);
      }.bind(this),
      success: function(response) {
        this.loadListItems();
      }.bind(this)
    });
  },

  loadListItems: function () {
    $.ajax({
      url: '/lists/' + this.props.list.id + '/list_items',
      type: 'GET',
      context: this,
      success: function(response) {
        this.setState({listItems: response['list_items']});
      }.bind(this),
    });
  },

  render: function() {
    var hideCompleted = this.state.hideCompleted;
    var listItems = this.state.listItems.map(function (listItem) { 
      return <ListItem list_item={listItem} 
                       key={listItem.id} 
                       hideCompleted={hideCompleted} /> });

    return (
      <div className="to-do-list">
        <div className="list-title-bar">
          <h1 className="list-title">{this.props.list.title}</h1>
          <div className="toggle-hidden-button">
            <ToggleHidden parent={this} hideCompleted={hideCompleted}/>
          </div>
        </div>
        <ul> 
          {listItems}         
        </ul>
        <ListItemNew list_id={this.props.list.id}
                     onListItemSubmit={this.handleListItemSubmit} />
      </div>      
    );
  }
});