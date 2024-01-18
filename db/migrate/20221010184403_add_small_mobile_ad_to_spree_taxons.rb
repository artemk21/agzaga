class AddSmallMobileAdToSpreeTaxons < ActiveRecord::Migration[6.1]
  def up
    add_attachment :spree_taxons, :small_ad_for_mobile
  end

  def down
    remove_attachment :spree_taxons, :small_ad_for_mobile
  end
end

# touched on 2025-07-09T19:39:52.268171Z
# touched on 2025-07-09T20:54:21.130027Z
# touched on 2025-07-09T20:54:50.479264Z