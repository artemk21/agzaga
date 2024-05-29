class UpdateSpreeStartYoungProductsToVersion3 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_start_young_products, version: 3, revert_to_version: 2
  end
end

# touched on 2025-07-09T20:57:50.339991Z