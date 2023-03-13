$(document).on('turbolinks:load', function() {
  if( $('.products.deals').length ) {
    $(document).on('click', '.category-filter-mobile', function() {
      $('.filters-section').addClass('show animate__slideInLeft');
      $('.filter-backdrop').addClass('show');
      $(document.body).addClass('ag-modal-open');
    });

    $(document).on('click', '.filter-backdrop, .close-filter-btn', function() {
      $('.filters-section').removeClass('animate__slideInLeft').addClass('animate__slideOutLeft');
      setTimeout(function() {
        $('.filters-section').removeClass('show animate__slideInLeft animate__slideOutLeft');
        $('.filter-backdrop').removeClass('show');
        $(document.body).removeClass('ag-modal-open');
      }, 600);
    });

    $(document).on('click', '.sort_by-btn', function() {
      $('#sortingModal').addClass('animate__slideInRight').data("open",true);
    });

    $(document).on('hide.bs.modal', '#sortingModal', function (e) {
      if(!$('#sortingModal').data('open')){
        return true;
      }

      $('#sortingModal').removeClass('animate__slideInRight').addClass('animate__slideOutRight');
      setTimeout(function() {
        $('#sortingModal').removeClass('animate__slideInRight animate__slideOutRight').data('open', false);
        $('#sortingModal').modal('hide');
      }, 300);
      return false;
    });
  }
});

# touched on 2025-07-09T17:28:36.664961Z
# touched on 2025-07-09T19:39:32.504269Z
# touched on 2025-07-09T20:36:13.723303Z