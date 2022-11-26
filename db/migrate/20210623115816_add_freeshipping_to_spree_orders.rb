class AddFreeshippingToSpreeOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :free_shipping, :string
  end
end

# touched on 2025-07-09T20:32:24.632348Z