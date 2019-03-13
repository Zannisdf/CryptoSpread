$(document).on('turbolinks:load', function(){
  $('#detailedInfoTable').tablesorter({
    theme: 'metro-dark',
    sortList: [[1,1]]
  });
});