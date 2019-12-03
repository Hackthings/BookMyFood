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
//= require turbolinks
//= require jquery3
//= require foundation
//= require awesomplete
//= require serviceworker-companion
//= require_tree .

$(document).on('turbolinks:load', function() {
  // Initialize Zurb Foundation JS
  $(document).foundation();
  // Remote modal with AJAX and Reveal
  $('body').on('click', '[data-open="ajax-reveal"]', function(e) {
    e.preventDefault();
    $('.reveal-content').html('<div class="loader"></div>');
    $.ajax({
      url: $(this).data('url'),
      success: function(result) {
        $('.reveal-content').html(result);
      },
      error: function(result) {
        if(result['status'] == 401) {
          var message = '<div class="flash-message callout border-none radius shadow warning" data-closable="true"><span class="text-warning">You\'ve been logged out. Please reload page and login again.</span></div>'
          // Implement login popup
        } else {
          var message = '<div class="flash-message callout border-none radius shadow warning" data-closable="true"><span class="text-warning">' + result['status'].toString() + ' : Error loading content. Please close popup and retry.' + '</span></div>'
        }
        $('.reveal-content').html(message);
      }
    });
  });
  // Clone fragment
  $('body').on('click', '.clone-fragment', function(e) {
    var blueprint = $(this).parents('.clonable-fragment');
    var clonedFragment = blueprint.clone();
    clonedFragment.find('input[type!=submit], select').val(null);
    $.each(clonedFragment.find('input, select'), function() {
      var name = $(this).attr('name');
      name = name.replace(/[0-9]/, function(i) { return parseInt(i) + 1 })
      $(this).attr('name', name);
    })
    clonedFragment.find('input:first').focus();
    blueprint.after(clonedFragment);
    $(this).parents('.cell').next('.cell').remove();
    $(this).remove();
  });
  // Remove clonable fragment
  $('body').on('click', '.delete-fragment', function(e) {
    if($('.clonable-fragment.' + $(this).data('parent-object')).length == 1) {
      alert('Cannot remove all the ' + $(this).data('entity') + 's');
    } else {
      deleteOrRestore($(this));
    }
  });
  // Delete or restore
  function deleteOrRestore(element) {
    var target = element.parents('.clonable-fragment:first').find('input[name$="[_destroy]"]');
    if(target.val() == 'true') {
      target.val(false)
      element.removeClass('warning').addClass('alert').html('&times;');
      element.parents('.clonable-fragment:first').find('input, select').css({'border-color': '#cacaca', 'background': 'white', 'opacity': 1, 'color': '#0a0a0a'}); // TODO: add note as 'Marked for destruction'
    } else {
      target.val(true)
      element.removeClass('alert').addClass('warning').html('&#x27F3;');
      element.parents('.clonable-fragment:first').find('input, select').css({'border-color': 'red', 'background': 'red', 'opacity': 0.2, 'color': 'white'}); // TODO: add note as 'Marked for destruction'
    }
  }
  // Show/hide scroll to top button
  $(document).on('scroll', function(){
    if ($(window).scrollTop() > 100) {
      $('.scroll-to-top').addClass('show');
    } else {
      $('.scroll-to-top').removeClass('show');
    }
  });
  // Scroll to top on click
  function scrollToTop() {
    var element = $('body');
    var offset = element.offset();
    var offsetTop = offset.top;
    $('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
  }
  $('.scroll-to-top').on('click', scrollToTop);

  $('body').on('click', '.plus-minus-btn .increment', function(e) {
    var $input = $(this).parents('.input-group').find('input[type=text]');
    var val = parseInt($input.val(), 10);
    !isNaN(val) ? $input.val(val + 1) : $input.val(0);
  });

  $('body').on('click', '.plus-minus-btn .decrement', function(e) {
    var $input = $(this).parents('.input-group').find('input[type=text]');
    var val = parseInt($input.val(), 10);
    (!isNaN(val) && val > 0) ? $input.val(val - 1) : $input.val(0);
  });
});