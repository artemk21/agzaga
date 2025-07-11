$(document).on('turbolinks:load', function(event) {
  if( $('.ffa_home.index').length ) {
    $(".toggle-support-content").click(function() {
      var elem = $(".toggle-support-content").text();
      if (elem == "READ MORE") {
        $(".toggle-support-content").text("READ LESS");
        $('.read-icon').addClass('read-less-icon');

        $('.read-icon').removeClass('read-more-icon');
        $(".text").slideDown();
      }

      else {
        $(".toggle-support-content").text("READ MORE");
        $('.read-icon').addClass('read-more-icon');

        $('.read-icon').removeClass('read-less-icon');
        $(".text").slideUp();
      }
    });

    $('.btn-ffa').on('click', function(e){
      e.preventDefault();
      var tagretElementTop = $($(this).attr('href')).position().top;
      var adjustment = $('.cta-card').height() + ($(window).width() > 767 ? 30 : $(this).attr('href')== '#heart-section'
? 191 : 100);
      $('html,body').animate({scrollTop: tagretElementTop - adjustment},'slow');
    });

    $(document).on('click', '.submit-btn-ffa', function() {
      var agree_policy = $('#agree_policy:visible').length ? $('#agree_policy:checked').length : false
      if(!agree_policy) {
        $('.agree-policy-error').html('You must agree to our Privacy Policy');
        $(this).prop('disabled', true);
      }
    });

    $(document).on('click', '#agree_policy', function() {
      var agree_policy = $('#agree_policy:visible').length ? $('#agree_policy:checked').length : false
       if(agree_policy) {
            $('.agree-policy-error').html('');
            $('.submit-btn-ffa').prop('disabled', false);
          }
    });
  }
});

# touched on 2025-07-09T17:39:29.842727Z
# touched on 2025-07-09T19:46:28.629873Z
# touched on 2025-07-09T20:36:42.085140Z
# touched on 2025-07-09T20:56:23.673572Z