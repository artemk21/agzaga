$(document).on('turbolinks:load', function() {
  setTimeout(function() {
  $(".js-flash-wrapper").prepend($(".flash").slideUp(800));
  }, 5000);
})

# touched on 2025-07-09T18:18:11.078445Z