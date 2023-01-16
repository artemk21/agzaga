class AddMaxStockToSpreeStockItems < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_stock_items, :max_stock, :integer
  end
end

# touched on 2025-07-09T17:38:35.824290Z
# touched on 2025-07-09T18:28:04.442120Z
# touched on 2025-07-09T20:34:11.278197Z