class AddColumnTarToSpreeOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :tar, :string, default: ''
  end
end

# touched on 2025-07-09T17:36:45.215779Z
# touched on 2025-07-09T18:28:04.443197Z
# touched on 2025-07-09T20:59:02.686151Z