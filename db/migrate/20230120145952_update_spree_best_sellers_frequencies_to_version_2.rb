class UpdateSpreeBestSellersFrequenciesToVersion2 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_best_sellers_frequencies, version: 2, revert_to_version: 1
  end
end

# touched on 2025-07-09T17:38:38.506822Z