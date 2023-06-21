class CreateSpreeOnSaleProductsOrderByStaffPicks < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_on_sale_products_order_by_staff_picks
  end
end

# touched on 2025-07-09T19:44:24.389137Z
# touched on 2025-07-09T20:39:04.711167Z