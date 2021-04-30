class AddColumnUtmSourceToSpreeOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :utm_source, :string, default: ''
  end
end

# touched on 2025-07-09T17:40:12.870275Z
# touched on 2025-07-09T18:19:40.799547Z