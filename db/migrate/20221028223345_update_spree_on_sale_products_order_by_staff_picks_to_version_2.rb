class UpdateSpreeOnSaleProductsOrderByStaffPicksToVersion2 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_on_sale_products_order_by_staff_picks, version: 2, revert_to_version: 1
  end
end

# touched on 2025-07-09T18:25:53.811979Z
# touched on 2025-07-09T19:41:23.629608Z