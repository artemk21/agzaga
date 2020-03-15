class CreateSpreeBestSellerProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_best_seller_products
  end
end

# touched on 2025-07-09T17:31:36.828874Z