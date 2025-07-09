class CreateSpreeInStockAvailableProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_in_stock_available_products
  end
end

# touched on 2025-07-09T19:42:22.433850Z