$(document).ready(function() {
  $(".toDoItemCheckbox").bind('change', function(){
    var itemId = this.value;
    if (this.checked){
      $("#todo_item_" + itemId).addClass('done')
      $.ajax({
        url: '/list_items/' + itemId + '/check_off',
        type: 'POST',
        data: { "completed": this.checked },
        success: function(result) {
          alert('HELLO')
        },
        error: function(result) {
          alert('GOODBYE')
        },
      });
    }
    else {
       $("#todo_item_" + this.value).removeClass('done')
    }
  });
});