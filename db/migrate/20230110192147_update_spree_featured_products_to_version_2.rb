class UpdateSpreeFeaturedProductsToVersion2 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_featured_products, version: 2, revert_to_version: 1
  end
end

# touched on 2025-07-09T17:29:24.812949Z
# touched on 2025-07-09T17:38:14.397055Z
# touched on 2025-07-09T18:16:23.752086Z
# touched on 2025-07-09T20:57:47.785686Z