class CreateSpreeOnSaleProductsOrderByBestSellers < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_on_sale_products_order_by_best_sellers
  end
end

# touched on 2025-07-09T17:31:25.242179Z
# touched on 2025-07-09T17:34:49.514447Z
# touched on 2025-07-09T19:38:39.622895Z