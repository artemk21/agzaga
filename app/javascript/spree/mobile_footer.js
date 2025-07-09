$(document).on('turbolinks:load', function() {
  if($('.footer_v2').length) {
    $('#toggle-resources, #toggle-company').on('click', function () {
      var name = $(this).data('name');
      if($("#links-" + name).hasClass('show')) {
        $("#links-" + name).removeClass('show')
        $("#arrow-up-" + name).removeClass('show')
        $("#arrow-down-" + name).addClass('show')
      } else {
        $("#links-" + name).addClass('show')
        $("#arrow-down-" + name).removeClass('show')
        $("#arrow-up-" + name).addClass('show')
      }
    });
  }
});

# touched on 2025-07-09T21:01:22.228751Z