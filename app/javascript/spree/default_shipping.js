$(document).on('turbolinks:load', function(event) {
  if( $('.checkout.edit').length ) {
    if($('#pickup').length || $('.confirmed-pickup').length || $('.saved-address-group.pickup').length) {
      $(document).on("click","#payment_step_submit_button",function() {
        bfirstname = $('#bfirstname').val();
        phone = $('#bphone').val();

        $('#default-sfirstname-field').val(bfirstname);
        $('#default-sphone-field').val(phone);
      });
    }
  }
});

# touched on 2025-07-09T18:15:37.558909Z