class CreateSpreeBestSellersFrequencies < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_best_sellers_frequencies
  end
end

# touched on 2025-07-09T18:27:07.612337Z
# touched on 2025-07-09T19:38:42.172367Z