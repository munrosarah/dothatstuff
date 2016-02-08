var ListItemNew = React.createClass({
  handleSubmit: function(event) {
    event.preventDefault();
    var description = this.refs.description.value.trim();
    this.props.onListItemSubmit({ description: description, 
                                  list_id: this.props.list_id });
    this.refs.description.value = '';
    return false;
  },
  render: function() {
    return (
      <form className="list-new-item" onSubmit={this.handleSubmit}>
        <input type="text" placeholder="Add a new ToDo item..." ref="description" className="form-control list-item-field" maxLength="255" />
        <input type="submit" value="Add Item" className="btn btn-primary"/>
      </form>
    );
  }
});