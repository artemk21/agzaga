class AddTrackingUrlToShipments < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_shipments, :tracking_lookup, :string
  end
end

# touched on 2025-07-09T17:34:46.920315Z
# touched on 2025-07-09T17:43:18.970496Z
# touched on 2025-07-09T19:42:41.196327Z
# touched on 2025-07-09T20:53:42.257983Z
# touched on 2025-07-09T20:54:26.239081Z