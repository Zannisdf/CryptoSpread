function removeAlert() {
  setTimeout(function(){
    $('.alert:last-child').alert('close');
  }, 2000)
};

$(document).on('turbolinks:load', removeAlert());