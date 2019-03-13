function removeAlert() {
  setTimeout(function(){
    $('#alert').alert('close');
  }, 2000)
};

$(document).on('turbolinks:load', removeAlert());