var ListShow = React.createClass({
  render: function() {
    var list_items = this.props.list_items.map(function (list_item) { 
      return <ListItem list_item={list_item} key={list_item.id} /> });
    
    return (
      <div className="toDoList">
        <h1>{this.props.list.title}</h1>
        <ul> 
          {list_items}         
        </ul>
      </div>
    );
  }
});