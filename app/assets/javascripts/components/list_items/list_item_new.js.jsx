var ListItemNew = React.createClass({
  handleSubmit: function() {
    var description = this.refs.description.value.trim();
    $.ajax({
      url: '/list_items/create',
      type: 'POST',
      data: { "list_item": 
              { "list_id": this.props.list_id, 
                "description": description }
            },
    });
  },
  render: function() {
    return (
      <form className="listItemNew" onSubmit={this.handleSubmit}>
        <input type="text" placeholder="Add a new ToDo item..." ref="description" />
        <input type="submit" value="Add Item" />
      </form>
    );
  }
});