$(document).ready(function() {
  $(".toDoItemCheckbox").bind('change', function(){
    var itemId = this.value;
    var checked = this.checked;
    $.ajax({
      url: '/list_items/' + itemId + '/toggle_completed',
      type: 'POST',
      data: { "completed": checked },
      success: function(result) {
        if (checked){
          $("#todo_item_" + itemId).addClass('done')
        }
        else {
          $("#todo_item_" + itemId).removeClass('done')
        }
      },
    });
  });
});