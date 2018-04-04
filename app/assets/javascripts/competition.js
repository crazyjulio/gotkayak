//= require jquery3
//= require jquery-ui/widgets/autocomplete
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require turbolinks

$(document).on('ready turbolinks:load', function() {
  var OneSignal = window.OneSignal || [];
  if (OneSignal.initialized !== true) {
    OneSignal.push(function() {
      OneSignal.init({
        appId: "c1c1ca78-8cb0-469c-b7ee-b62367e7553b"
      });
    });
  }

  $("input[type=file]").change(function() {
    var fieldVal = $(this).val();
    if (fieldVal != undefined || fieldVal != "") {
      var string = '';
      var files = $("input[type=file]").get(0).files;
      jQuery.each(files, function(i, val) {
        if (i === 0) {
          string += val.name;
        } else {
          string += ', ' + val.name
        }
      })
      $(this).next(".custom-file-label").text(string);
    }
  });

  jQuery(function() {
    return $('#fish_species').autocomplete({
      source: $('#fish_species').data('autocomplete-source')
    });
  });

  jQuery(function() {
    return $('#fish_location').autocomplete({
      source: $('#fish_location').data('autocomplete-source')
    });
  });

  $('.modal').on('shown.bs.modal', function(e) {
    $(this).find('textarea[id="comment"]').focus();
    var fishId = $(e.relatedTarget).data('fish-id');
    $('.comment_fish_id').val(fishId);
    var comment = $(e.relatedTarget).data('comment');
    if (comment === undefined) {
      // nothing
    } else {
      $('#new_comment').val(comment.comment);
      $('#original_comment').val(JSON.stringify(comment));
    }
  });

  $("#fish-notification-frequency").val(getCookie('fish-notification-frequency'));
  $("#comment-notification-frequency").val(getCookie('comment-notification-frequency'));

  function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == ' ')
        c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0)
        return c.substring(nameEQ.length, c.length);
    }
    return null;
  }

  function setCookie(name, value, days) {
    var expires = "";
    if (days) {
      var date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
      expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (
      value || ""
    ) + expires + "; path=/";
  }

  $("#fish-notification-frequency").change(function() {
    var val = $(this).val();
    try {
      // Write the value to a cookie for retrieval on page load.
      setCookie('fish-notification-frequency', val, 1000);
      OneSignal.sendTag('fish_frequency', val);
      element = document.getElementById('fish-notification-update');
      element.innerHTML = '<p class="text-success">Successfully Set To ' + val.substr(0, 1).toUpperCase() + val.substr(1); +
      '</p>';
    } catch (error) {
      element = document.getElementById('fish-notification-update');
      element.innerHTML = '<p class="text-danger">Was NOT Updated</p>';
      console.error(error);
    }
  });

  $("#comment-notification-frequency").change(function() {
    var val = $(this).val();
    try {
      // Write the value to a cookie for retrieval on page load.
      setCookie('comment-notification-frequency', val, 1000);
      OneSignal.sendTag('comment_frequency', val);
      element = document.getElementById('comment-notification-update');
      element.innerHTML = '<p class="text-success">Successfully Set To ' + val.substr(0, 1).toUpperCase() + val.substr(1); +
      '</p>';
    } catch (error) {
      element = document.getElementById('comment-notification-update');
      element.innerHTML = '<p class="text-danger">Was NOT Updated</p>';
      console.error(error);
    }
  });

  if ($('#notification-frequency-form').length) {
    OneSignal.push(function() {
      OneSignal.getUserId().then(function(userId) {
        if (typeof userId != 'undefined') {
          $('#notification-frequency-form').show();
        }
      });
    });
  }
})