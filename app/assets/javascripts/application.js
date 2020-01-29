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
          $('#default-keyword').append('<tr><td>' + (word_name) + '</td></tr>').addClass('table-color');
        }
        else {
          for(j = 0; j < keyword_row; j++) {
            var keyword_name = $('#default-keyword').children('tr')[j].innerText;
            if(keyword_name != word_name) {
              count += 1;
              if(keyword_row == count) {
                $('#default-keyword').append('<tr><td>' + (word_name) + '</td></tr>').addClass('table-color');
              }
            }
          }
        }
      }
      count = 0;
    }
  });

  $('#default-keyword').on("click", "tr", function(event) {
    $(this).remove();
  });
});
