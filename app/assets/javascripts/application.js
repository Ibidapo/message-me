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
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require_tree .

scroll_bottom = function() {
  chatbox_height = $('.chatbox')[0].scrollHeight;

  if (chatbox_height > 508) {
    $('.chatbox').animate({ scrollTop: chatbox_height }, 400);
  }
}

reset_value = function () {
  $('#chatbox-input').val("");
}

reset_input = function() {
  $('.textare form').on('keydown', function(e) {
    if (e.keyCode == 13)
      setTimeout(reset_value, 300)
  })

  $('#chatbox-btn').on('click', function() {
    setTimeout(reset_value, 300)
  })
}

$(document).on('turbolinks:load',function() {
  $('.ui.dropdown').dropdown();

  $('.screen .ui.sidebar')
    .sidebar({ context: $('.screen .chatbox-segment') })
    .sidebar('attach events', '.screen .app-nav-bar .left.item')
    .sidebar('setting', 'transition', 'overlay');

  $('.message .close').on('click', function () {
    $(this).closest('.message').transition('fade');
  });

  reset_input()
  scroll_bottom()
});
