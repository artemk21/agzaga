class AddMaxStockToSpreeStockItems < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_stock_items, :max_stock, :integer
  end
end

# touched on 2025-07-09T17:38:35.824290Z