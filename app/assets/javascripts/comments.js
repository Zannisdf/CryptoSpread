$(document).on('turbolinks:load', function(){
  $('.comments-container').click(function(e){
    if (e.target && e.target.className === 'delete'){
      e.preventDefault();
      $.ajax({
        type: "DELETE",
        url: e.target.href,
        success: function (response) {
          $(`#${response['comment_id']}`).hide(300);
        }
      });
    }
  })
})