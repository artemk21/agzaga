class CreateSpreeChuckwagonPreOrders < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_chuckwagon_pre_orders
  end
end

# touched on 2025-07-09T17:31:54.222735Z