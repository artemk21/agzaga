class AddGoogleProductCategoryToSpreeProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_products, :google_product_category, :integer
  end
end

# touched on 2025-07-09T20:34:33.331393Z