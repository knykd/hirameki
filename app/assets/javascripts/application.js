// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require activestorage
//= require popper
//= require bootstrap-sprockets
//= require_tree .

/* TODO: 選択、非選択のclass付け見直し */
$(function() {
  $('#update-word').on('click', 'td', function() {
    if($(this).hasClass('table-color')) {
      $(this).removeClass('table-color');
      $(this).addClass('select-color');
    }
    else {
      $(this).removeClass('select-color');
      $(this).addClass('table-color');
    }
  });
});

$(function() {
  $('#right-arrow').click(function(event){
    var count = 0;
    var select_word_class = "select-color"
    var keyword_row = $("#keyword-table tbody").children().length;;
    for(i = 0; i < 10; i++) {
      if(select_word_class == $('#update-word').find('td')[i].className) {
        var word_name = $('#update-word').children('tr')[i].innerText;
        if(keyword_row == 0) {
          id = $('#update-word').find('td')[i].id
          $('#default-keyword').append(`<tr><td id=keyword-${id}>` + (word_name) + '</td></tr>').addClass('table-color');
        }
        else {
          for(j = 0; j < keyword_row; j++) {
            var keyword_name = $('#default-keyword').children('tr')[j].innerText;
            if(keyword_name != word_name) {
              count += 1;
              if(keyword_row == count) {
                id = $('#update-word').find('td')[i].id
                $('#default-keyword').append(`<tr><td id=keyword-${id}>` + (word_name) + '</td></tr>').addClass('table-color');
              }
            }
          }
        }
      }
      count = 0;
    }
    event.preventDefault();
  });

  $('#default-keyword').on('click', 'tr', function(event) {
    $(this).remove();
  });
});

$(function() {
  $(document).on('click', '#create_word', function(event) {
    /* キーワードの個数取得  */
    var keyword_row = $("#keyword-table tbody").children().length;;
    var query = '';
    var param = '';
    /* キーワード数だけそれぞれのID取得 */
    for(i = 0; i < keyword_row; i++){
      id = $('#default-keyword').find('td')[i].getAttribute("id");
      /* {keyword-id}->{id}に変換 */
      word_id = id.substr(8);
      /* クエリ文字列作成 */
      tmp = `${i+1}=${word_id}`;
      query += tmp;
      if(i != keyword_row-1) {
        query += "&";
      }
      /* 取得した値をパラメータにセット */
      param = query;
    }
    /* アドレスにパラメータを付加 */
    location.href='/ideas/new?'+param;
  });
});
