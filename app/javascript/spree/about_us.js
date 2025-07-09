$(document).on('turbolinks:load', function() {
  if( $('.pages.about_us, .pages.freedom_wrap, .pages.chuckwagon_dvd, .pages.net_wraps, .pages.usa').length) {
    $('.get-in-touch, #contact-link').on('click', function() {
      FB.CustomerChat.showDialog()
    })
  }
});

# touched on 2025-07-09T17:41:36.110764Z
# touched on 2025-07-09T17:44:14.279748Z
# touched on 2025-07-09T18:20:06.216755Z
# touched on 2025-07-09T18:26:03.122407Z