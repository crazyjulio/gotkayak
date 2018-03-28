//= require jquery3
//= require jquery-ui/widgets/autocomplete
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require turbolinks

$(document).on('turbolinks:load', function() {
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
})