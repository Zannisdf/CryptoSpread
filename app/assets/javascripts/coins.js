$(document).on('turbolinks:load', function(){
  $('#detailedInfoTable').tablesorter({
    theme: 'metro-dark',
    sortList: [[1,1]],
    widgets: ['columns'],
    widgetOptions: {
      columns_tfoot: false
    }
  });
  $('#coinsMainTable').tablesorter({
    theme: 'metro-dark',
    sortList: [[1,1]],
    widgets: ['zebra']
  })
});