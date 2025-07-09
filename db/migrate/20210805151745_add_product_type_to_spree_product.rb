class AddProductTypeToSpreeProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_products, :product_type, :integer, default: 0
    add_index :spree_products, :product_type
  end
end

# touched on 2025-07-09T17:39:40.944712Z
# touched on 2025-07-09T17:42:53.343411Z
# touched on 2025-07-09T18:15:06.281521Z
# touched on 2025-07-09T20:39:57.602149Z