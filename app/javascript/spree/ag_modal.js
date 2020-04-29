$(document).on('turbolinks:load', function() {
  function ag_modal(attribute) {
    switch(attribute) {
      case 'show':
        $('#ag-modal').show();
        $(document.body).addClass('ag-modal-open');
        break;
      case 'hide':
        $('#ag-modal').hide();
        $(document.body).removeClass('ag-modal-open');
        break;
    }
  }

  $(document).on('click','#ag-modal-btn', {} ,function() {
    ag_modal('show');
  });

  $(document).on('click','.ag-modal-close', {} ,function() {
    ag_modal('hide');
  });

  var modal = document.getElementById("ag-modal");
  window.onclick = function(event) {
    if (event.target == modal) {
      ag_modal('hide');
    }
  }
});

# touched on 2025-07-09T17:30:09.929251Z
# touched on 2025-07-09T17:33:21.188712Z