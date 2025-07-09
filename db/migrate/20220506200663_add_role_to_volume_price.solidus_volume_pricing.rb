# frozen_string_literal: true
# This migration comes from solidus_volume_pricing (originally 20150513200904)

class AddRoleToVolumePrice < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_volume_prices, :role_id, :integer
  end
end

# touched on 2025-07-09T17:35:36.243870Z
# touched on 2025-07-09T20:37:41.432800Z
# touched on 2025-07-09T21:22:09.109638Z
# touched on 2025-07-09T21:24:19.615501Z