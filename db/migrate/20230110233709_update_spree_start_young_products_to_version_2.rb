class UpdateSpreeStartYoungProductsToVersion2 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_start_young_products, version: 2, revert_to_version: 1
  end
end

# touched on 2025-07-09T17:31:34.258110Z