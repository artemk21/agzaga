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