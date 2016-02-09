var FlashMessages = React.createClass({
  getInitialState: function() {
    return { notifications: [], errors: [] };
  },

  componentDidMount: function(){
    window.addEventListener('flashMessages', this.handleFlashMessagesEvent, false);
  },

  handleFlashMessagesEvent: function(e) {
    var response = e.detail['response'];
    var messages = JSON.parse(response.getResponseHeader('X-FlashMessages')) || {};
    var notifications = messages['notifications'] || [];
    var errors = messages['errors'] || [];
    this.setState({notifications: notifications, errors: errors});
  },

  render: function() {
    var notifications;
    var errors;

    if (this.state.notifications.length > 0) {
      notifications = (<FlashMessage messages={this.state.notifications}
                                     messageClass="notification" />);
    };
    
    if (this.state.errors.length > 0) {
      errors = (<FlashMessage messages={this.state.errors}
                              messageClass="error" />);
    };

    return (
      <div>          
        {notifications}
        {errors}                 
      </div>
    );
  }
});

var FlashMessage = React.createClass({  
  render: function() {
    var messageID;
    var messageClass = "alert";
    var messages = this.props.messages.map(function (message, i) { 
      return (<li key={i}>{message}</li>)});

    if (this.props.messageClass == "error") {
      messageClass += " alert-danger";
      messageID = "flashErrors";
    } else if (this.props.messageClass == "notification"){
      messageClass += " alert-success";
      messageID = "flashNotifications";
    }

    return (
      <div className={messageClass} id={messageID}>
        <ul>
          {messages}
        </ul>
      </div>
    );
  }
});