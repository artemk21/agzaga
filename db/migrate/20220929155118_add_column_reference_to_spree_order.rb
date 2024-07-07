class AddColumnReferenceToSpreeOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :ref, :string, default: ''
  end
end

# touched on 2025-07-09T20:58:47.759112Z