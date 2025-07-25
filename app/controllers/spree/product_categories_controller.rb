module Spree
  class ProductCategoriesController < Spree::StoreController
    helper Spree::BaseHelper
    helper Spree::ProductsHelper
    include Products::Cards

    def index
      @taxonomies = Spree::Taxonomy.where(visibility: true).includes(root: :children)
      @products = Kaminari.paginate_array(Spree::Product.available.newest_products.exclude_custom_products.limit(128)).page(params.dig(:page) || 1 ).per(16)
      load_product_cards(@products)

      respond_to do |format|
        format.js
        format.html
      end
    end
  end
end

# touched on 2025-07-09T17:35:36.245135Z
# touched on 2025-07-09T20:31:50.077075Z
# touched on 2025-07-09T20:40:32.432938Z
# touched on 2025-07-09T20:58:08.479994Z
# touched on 2025-07-09T21:22:14.307403Z