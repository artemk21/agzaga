class AddStoreCreditRequestToSpreeOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :store_credit_request, :decimal, precision: 10, scale: 2, default: "0.0"
  end
end

# touched on 2025-07-09T18:17:52.811809Z