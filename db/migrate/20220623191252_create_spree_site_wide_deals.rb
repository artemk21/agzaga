class CreateSpreeSiteWideDeals < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_site_wide_deals
  end
end

# touched on 2025-07-09T17:41:58.283735Z
# touched on 2025-07-09T20:38:39.295347Z