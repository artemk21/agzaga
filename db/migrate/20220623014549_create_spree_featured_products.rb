class CreateSpreeFeaturedProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_featured_products
  end
end

# touched on 2025-07-09T19:37:31.583692Z