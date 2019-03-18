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
    sortList: [[2,1]],
    widgets: ['zebra']
  })

  checkPrice($('.price'));
});

function checkPrice(priceObj){
  price = priceObj.text().split('').slice(0,priceObj.text().indexOf('%')).join('');
  if(price > 0){
    priceObj.addClass('positive');
  } else if(price < 0){
    priceObj.addClass('negative');
  }
}