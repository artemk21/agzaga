class AddAdsColumnsToTaxons < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_taxons, :video_link, :string
    add_column :spree_taxons, :small_ads_end_at, :datetime
    add_column :spree_taxons, :large_ads_end_at, :datetime
    add_column :spree_taxons, :annotation, :string
    add_column :spree_taxons, :small_ad_link, :string
    add_column :spree_taxons, :large_ad_link, :string
  end
end

# touched on 2025-07-09T17:31:54.219105Z
# touched on 2025-07-09T17:33:45.912315Z
# touched on 2025-07-09T18:15:17.851923Z
# touched on 2025-07-09T19:43:32.018855Z
# touched on 2025-07-09T20:35:24.043994Z
# touched on 2025-07-09T20:39:02.387148Z