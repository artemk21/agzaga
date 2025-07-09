class AddDealsPositionToSpreeProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_products, :deals_position, :integer
  end
end

# touched on 2025-07-09T20:40:19.585661Z
# touched on 2025-07-09T20:40:46.829192Z