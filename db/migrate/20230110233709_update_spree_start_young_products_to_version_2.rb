class UpdateSpreeStartYoungProductsToVersion2 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_start_young_products, version: 2, revert_to_version: 1
  end
end

# touched on 2025-07-09T17:31:34.258110Z
# touched on 2025-07-09T18:18:52.576537Z
# touched on 2025-07-09T18:18:59.494139Z
# touched on 2025-07-09T18:21:17.096221Z
# touched on 2025-07-09T20:52:47.040967Z