$(document).on('turbolinks:load', function(){
  $('.purpose').each(function(){
    var type = $(this).text()
    if(type === '生活費') {
      $(this).css('background-color', 'lightgoldenrodyellow');
      $(this).next().css('background-color', 'lightgoldenrodyellow');
      $(this).prev().css('background-color', 'lightgoldenrodyellow');
    }else if(type === '趣味・娯楽') {
      $(this).css('background-color', 'lightcoral');
      $(this).next().css('background-color', 'lightcoral');
      $(this).prev().css('background-color', 'lightcoral');
    }else if(type === '仕事・勉強') {
      $(this).css('background-color', 'lightgreen');
      $(this).next().css('background-color', 'lightgreen');
      $(this).prev().css('background-color', 'lightgreen');
    }
  });

  $('.fa-trash-alt').click(function(){
    alert('この勘定を削除します');
  })

  // ゴミ箱clickで勘定削除して合計金額計算
  // $('a[data-method="delete"]').on('ajax:success', function(xhr,data,status){
  //   alert('この勘定を削除します');
  //   var money = parseInt($(this).parent('td').prev('td').text());
  //   var sum_money = parseInt($('#sum_money').text());
  //   sum_money = sum_money - money
  //   $('#sum_money').text(sum_money);
  //   $(this).parent('td').parent('tr').fadeOut();
  // });
});