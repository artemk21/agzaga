class AddSmallAddToSpreeTaxons < ActiveRecord::Migration[6.1]
  def up
    add_attachment :spree_taxons, :small_ads
  end

  def down
    remove_attachment :spree_taxons, :small_ads
  end
end

# touched on 2025-07-09T17:34:38.208197Z
# touched on 2025-07-09T20:39:42.308155Z
# touched on 2025-07-09T20:52:59.444026Z
# touched on 2025-07-09T21:00:59.360777Z