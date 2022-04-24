document.addEventListener("turbolinks:load", () => {
  if (process.env.GTM_INTEGRATION == 'Active') {
    if($('.purchase-tag').length){
      var i = 0;
      var items = [];
      var product_ids = [];
      var custom_hose = false;
      var item_count = $('.order_info').data('count');

      if( $('.order_item').length > 0 ) {
        var hash = {};
        hash['item_name']= 'Custom Hose',
        hash['item_id']= $('.order_item').slice(-1)[0].dataset.id,
        hash['price']= $('.order_item').slice(-1)[0].dataset.price,
        hash['currency']= $('.order_item').slice(-1)[0].dataset.currency,
        hash['quantity']= 1,
        hash['item_list_name']= 'Not Listed',
        hash['item_list_id']= 0

        items.push(hash);
        item_count = item_count - 4;
      }

      while(i < item_count ) {
        var hash = {};

        hash['item_name']= $('.order_item_'+i).data().name,
        hash['item_id']= $('.order_item_'+i).data().id,
        hash['price']= $('.order_item_'+i).data().price,
        hash['quantity']= $('.order_item_'+i).data().quantity,
        hash['currency']= $('.order_item_'+i).data().currency,
        hash['item_list_name']= $('.order_item_'+i).data().listname,
        hash['item_list_id']= $('.order_item_'+i).data().listid

        items.push(hash);
        product_ids.push($('.order_item_'+i).data().id);

        i = i+ 1;
      }

      coupon = $('.order_info').data('coupon') == '' ? "No promo" : $('.order_info').data('coupon');

      dataLayer.push({ 'ecommerce': null });
      dataLayer.push({'event': 'purchase', 'ecommerce': {
        transaction_id: $('.order_info').data().id,
        value: $('.order_info').data().value,
        shipping: $('.order_info').data().shipping,
        currency: $('.order_info').data().currency,
        coupon: coupon,
        items: items
      }});

      window.uetq = window.uetq || [];
      window.uetq.push ('event', 'PRODUCT_PURCHASE', {
        'ecomm_prodid': product_ids,
        'ecomm_pagetype': 'PURCHASE',
        'revenue_value': $('.order_info').data().value,
        'currency': $('.order_info').data().currency
      });

      if($('#google-ad-gclid').html() != '')
      {
        gtag('event', 'conversion', {
          'send_to': 'AW-358198426/Nb2bCIzjnsMCEJrZ5qoB',
          'value': $('.order_info').data().value,
          'currency': 'USD',
          'transaction_id': $('.order_info').data().id
        });
      }

      sessionStorage.removeItem("begin_checkout");
    };

    $('.search-tag, .product-card .name, .product-card .image-container').click(function() {
      if ($(this).parents('.product-card').children('.image-container').children('.product-card-info').length == 1) {
        gtag("event", "view_item", {
          items: [{
              item_name: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().name,
              item_id: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().id,
              price: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().price,
              currency: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().currency,
              quantity: 1,
              item_list_name: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().listname,
              item_list_id: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().id
            }]
        });

        if ($(this).parents('.product-card').children('.image-container').children('.product-card-info').data().promotion) {
          gtag("event", "view_promotion", {
            items: [{
                item_name: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().name,
                item_id: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().id,
                price: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().price,
                currency: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().currency,
                item_list_name: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().listname,
                item_list_id: $(this).parents('.product-card').children('.image-container').children('.product-card-info').data().id,
                quantity: 1,
                promotion_id: 1,
                promotion_name: "Deals Product"
            }]
          });
        }
      }
    });

    $(document).on('click', '.checkout-button', function() {
      var begin_checkout = 1;
      if (sessionStorage.begin_checkout) {
        begin_checkout = begin_checkout + 1;
        sessionStorage.setItem("begin_checkout", begin_checkout);
      }
      else if (!sessionStorage.begin_checkout) {
        sessionStorage.setItem("begin_checkout", begin_checkout);
      }
    });

    $('.add-to-cart').click(function() {
      if( $(this).parents('.product-quick-view').length) {
        gtag("event", "add_to_cart", {
          items: [{
            item_name: $(this).parents('.product-quick-view').children('.quick_view').data().name,
            item_id: $(this).parents('.product-quick-view').children('.quick_view').data().id,
            price: $(this).parents('.product-quick-view').children('.quick_view').data().price,
            quantity: $(this).parents('.quantity-cart-btn-group').children().find(".quantity").val(),
            currency: $(this).parents('.product-quick-view').children('.quick_view').data().currency
          }]
        });
      }
    });

    $('#add-to-cart-button').click(function() {
      if( $(this).parents('.product-details-group').length) {
        gtag("event", "add_to_cart", {
          items: [{
            item_name: $(this).parents('.product-details-group').children('.product-info').data().name,
            item_id: $(this).parents('.product-details-group').children('.product-info').data().id,
            price: $(this).parents('.product-details-group').children('.product-info').data().price,
            currency: $(this).parents('.product-details-group').children('.product-info').data().currency,
            quantity: $(this).prev().children()[0].children[1].value
          }]
        });
      }
    });

    $('#add_custom').click(function() {
      if ( !document.getElementById("add_custom").disabled ) {
        gtag("event", "add_to_cart", {
          items: [{
            item_name: 'Custom Hose',
            item_id: $('.variant-data').data().id,
            price: $('#subtotal-price').text().replace("$",""),
            currency: $('.variant-data').data().currency,
            quantity: 1
          }]
        });
      }
    });
  }
});

# touched on 2025-07-09T18:18:00.463047Z
# touched on 2025-07-09T18:19:50.542049Z
# touched on 2025-07-09T19:40:52.752646Z