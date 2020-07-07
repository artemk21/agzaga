$(document).on('turbolinks:load', function() {
  if($('.products.show').length || $('.pages.chuckwagon_dvd')) {
    document.addEventListener('turbolinks:before-cache', function() {
      slider.destroy();
    });

    var $gallery = $('.lightgallery');

    $gallery.lightGallery();

    function lightSliderSeting() {
      var object = {
                      gallery: true,
                      item: 2,
                      thumbItem: 13,
                      slideMargin: 16,
                      auto: false,
                      loop: false,
                      thumbMargin: 10,
                      controls: false,
                      responsive : [
                        {
                          breakpoint: 991,
                          settings: {
                            item: 2,
                            thumbItem: 6,
                          }
                        },
                        {
                        breakpoint: 600,
                          settings: {
                            item: 1,
                            thumbItem: 6
                          }
                        }
                      ],
                      onSliderLoad: function() {
                        $('.lightgallery').removeClass('cS-hidden');
                        $('.slider-nav-group').removeClass('cS-hidden');
                        $('.product-sku').removeClass('cS-hidden');

                        if ( $('.pro-img:visible').length < 4 ) {
                          $('.slider-nav-group').hide();
                        }
                      }
                    }

      return object;
    }

    var slider = $('.lightgallery').lightSlider(lightSliderSeting());

    $('.product-variants input[name="variant_id"]').on('click', function() {
      if($('.products.show').length)
      {
        $('.lightgallery').data('lightGallery').destroy(true);

        var selected_id = $(this).attr('id').split('_')[2];
        var selectedImages = images.filter( v => (v.id == selected_id || v.id == masterVarientId));

        slider.destroy();

        $('.pro-img').remove();
        $('.lightgallery').html(selectedImages.map( v => v.element ));
        $('.lightgallery').lightGallery();

        slider = $('.lightgallery').lightSlider(lightSliderSeting());
      }
    });

    $('.goToPrevSlide').on('click', function () {
        slider.goToPrevSlide();
    });

    $('.goToNextSlide').on('click', function () {
        slider.goToNextSlide();
    });
  }
});

$(document).ready(function() {
  if($('.home.index').length || $('.products.show').length  || $('.product_categories.index').length || $('.orders.edit').length || $('.orders.show').length || $('.products.index').length || $('.favorites.index').length || $('.taxons.show').length || $('.pages.chuckwagon_dvd').length) {
    var quickViewSlider = '';
    var quickViewSliderOptions = {
                      gallery: true,
                      item: 1,
                      thumbItem: 4,
                      slideMargin: 20,
                      auto: false,
                      loop: false,
                      controls: false,
                      onSliderLoad: function(el) {
                        $('.product-image-slider').removeClass('cS-hidden');

                        if ( quickViewSlider.children().length > 1 ) {
                          $('.quick-view-slider-nav-group').show();

                        } else {
                          $('.quick-view-slider-nav-group').hide();
                        }

                        var showActiveSlides = function(entries) {
                          entries.forEach(function(entry) {
                            if (entry.isIntersecting) {
                              entry.target.src = entry.target.src;
                              observer.unobserve(entry.target);
                            }
                          });
                        };

                        var imageWidth = el.find("li").outerWidth() + "px";

                        var observer = new window.IntersectionObserver(showActiveSlides, {
                          root: el.parent()[0],
                          rootMargin: "0px " + imageWidth + " 0px " + imageWidth
                        });

                        el.find("li img").each(function() {
                          observer.observe(this);
                        });
                      }
                    }

    $(document).on('show.bs.modal', '.product-quick-view .modal', function () {
      $(this).find('.images-slider-group').addClass('cS-hidden');
    });

    $(document).on('shown.bs.modal', '.product-quick-view .modal', function () {
      $(this).find('.images-slider-group').removeClass('cS-hidden');
      $(this).find('.product-image-slider').addClass('cS-hidden');

      quickViewSlider = $(this).find('.product-image-slider').lightSlider(quickViewSliderOptions);
    });

    $(document).on('hidden.bs.modal', '.product-quick-view .modal', function () {
      quickViewSlider.destroy();
    });


    $(document).on('change', '.product-quick-view input[type="radio"]', function() {
      var selected_id = $(this).attr('id').split('_')[2];
      var pro_id = $(this).parent().parents('.options-tab-content').attr('id').split('-')[1];
      var selected_images = $('.data-for-quick-view-slider[data-id="product-image-for-'+ selected_id +'"], '+
                              '.data-for-quick-view-slider[data-id="product-image-for-'+ pro_id +'"]');
      var slides = '';
      selected_images.each(function() {
        slides += prepareSlide( $(this).data('image') , selected_id )
      });

      quickViewSlider.destroy();

      $(this).parents('.product-quick-view').find('.quick-view-product-images').remove();
      $(this).parents('.product-quick-view').find('.product-image-slider').html(slides);

      quickViewSlider = $(this).parents('.product-quick-view').find('.product-image-slider').lightSlider(quickViewSliderOptions);
    });

    function prepareSlide( image, id) {
      var element = '<li data-responsive="'+ image +'" data-src="'+ image +'" data-thumb="'+ image +'" class="quick-view-product-images product-image-for-'+ id +'">' +
                    '<img src="'+ image +'" />' +
                    '</li>';

      return element;
    }

    $(document).on('click', '.quick-view-slider-nav', function () {
      if ( $(this).data('target') === 'prev' ) {
        quickViewSlider.goToPrevSlide();

      } else {
        quickViewSlider.goToNextSlide();
      }
    });
  }
});

# touched on 2025-07-09T17:36:55.533745Z