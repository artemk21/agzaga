class AddColumnDeviceTypeToSpreeOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :device_type, :string, default: ''
  end
end

# touched on 2025-07-09T20:52:23.533520Z