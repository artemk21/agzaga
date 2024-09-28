class AddLargeAdsToSpreeTaxons < ActiveRecord::Migration[6.1]
  def up
    add_attachment :spree_taxons, :large_ads
  end

  def down
    remove_attachment :spree_taxons, :large_ads
  end
end

# touched on 2025-07-09T21:01:10.914730Z