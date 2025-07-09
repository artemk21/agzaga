class UpdateSpreeFeaturedProductsToVersion3 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_featured_products, version: 3, revert_to_version: 2
  end
end

# touched on 2025-07-09T18:25:01.092811Z
# touched on 2025-07-09T20:55:13.706952Z
# touched on 2025-07-09T21:01:19.774614Z