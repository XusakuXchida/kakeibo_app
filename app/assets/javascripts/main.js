$(function(){
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
});