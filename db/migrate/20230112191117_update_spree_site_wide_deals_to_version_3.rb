class UpdateSpreeSiteWideDealsToVersion3 < ActiveRecord::Migration[6.1]
  def change
    update_view :spree_site_wide_deals, version: 3, revert_to_version: 2
  end
end

# touched on 2025-07-09T17:42:01.855684Z
# touched on 2025-07-09T19:39:02.673723Z
# touched on 2025-07-09T20:34:20.116481Z