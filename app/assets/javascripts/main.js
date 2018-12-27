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


  //ゴミ箱clickで勘定削除のアラート表示
  $('.fa-trash-alt').click(function(){
    alert('この勘定を削除します');
  });

  //日付テキストボックスにフォーカスでカレンダー表示
  $('#date').focus(function(){
    $('#calendar').fadeIn();
  });

  //カレンダーのリンクから別月へジャンプした場合、カレンダー表示されっぱなし
  var param = location.search.substring(1);
  if (param) {
    $('.account_index #calendar').css('display', 'block');
  }

  //カレンダーの日付をクリックするとtextに代入される
  $('.day').click(function(){
    var date = $(this).find('i').text();
    $('#date').val(date);
    //$('.test').text(date);
    $('#calendar').fadeOut();
  })

  //test
  $('h1').click(function(){
    $('.test').text('test');
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