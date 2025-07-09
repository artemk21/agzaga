class UpdateSpreeMakeEasyProductsToVersion2 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_make_easy_products, version: 2, revert_to_version: 1
  end
end

# touched on 2025-07-09T18:25:03.430622Z