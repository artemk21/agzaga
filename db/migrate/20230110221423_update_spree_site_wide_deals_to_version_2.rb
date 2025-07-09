class UpdateSpreeSiteWideDealsToVersion2 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_site_wide_deals, version: 2, revert_to_version: 1
  end
end

# touched on 2025-07-09T19:38:28.946432Z
# touched on 2025-07-09T20:31:39.988867Z
# touched on 2025-07-09T20:37:48.520992Z