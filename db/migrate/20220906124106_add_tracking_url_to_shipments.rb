class AddTrackingUrlToShipments < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_shipments, :tracking_lookup, :string
  end
end

# touched on 2025-07-09T17:34:46.920315Z