class AddPickupLabelToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :is_pickup, :boolean, default: false
  end
end

# touched on 2025-07-09T18:17:23.454765Z
# touched on 2025-07-09T20:35:44.354202Z