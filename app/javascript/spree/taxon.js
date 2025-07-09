$(document).on('turbolinks:load', function() {
  if( $('.taxons.show').length ) {
    $('.scrollToTop').click(function(){
      $('html, body').animate({
        scrollTop: $("#taxon-show-all").offset().top
      }, 800);
      return false;
    });
  }
});

# touched on 2025-07-09T21:23:30.454364Z