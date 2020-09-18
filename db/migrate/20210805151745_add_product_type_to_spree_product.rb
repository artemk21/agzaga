class AddProductTypeToSpreeProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_products, :product_type, :integer, default: 0
    add_index :spree_products, :product_type
  end
end

# touched on 2025-07-09T17:39:40.944712Z