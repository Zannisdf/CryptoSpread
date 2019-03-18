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

  if($('#chart_div').length === 1){
    getData();
  }
});

function checkPrice(prices){
  prices.each(function(){
    price = $(this).text().split('').slice(0,$(this).text().indexOf('%')).join('');
    if(price > 0){
      $(this).addClass('positive');
    } else if(price < 0){
      $(this).addClass('negative');
    }
  })
}

function getData(){
  $.ajax({
    type: "get",
    url: "/coins/chart_data",
    data: { id: parseInt(window.location.href.slice(window.location.href.lastIndexOf('/')+1)) },
    success: function (response) {
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable(response, true);

        var formatter = new google.visualization.NumberFormat(
            {fractionDigits: 5});
        formatter.format(data, 1);
        formatter.format(data, 2);
        formatter.format(data, 3);
        formatter.format(data, 4);

        var options = {
          legend:'none',
          bar: { groupWidth: '100%' },
          candlestick: {
            risingColor: {stroke: '#678e52', fill: '#678e52'},
            fallingColor: {stroke: '#F44336'},
          },
          
          colors: ['#333']
        };

        var chart = new google.visualization.CandlestickChart(document.getElementById('chart_div'));

        chart.draw(data, options);
      }
    }
  });
}