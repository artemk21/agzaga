class AddPositionToSpreeProducts < ActiveRecord::Migration[6.1]
  def up
    add_column :spree_products, :position, :integer
  end

  def down
    remove_column :spree_products, :position
  end
end

# touched on 2025-07-09T18:27:49.636479Z
# touched on 2025-07-09T20:35:31.035650Z
# touched on 2025-07-09T20:53:20.447362Z
# touched on 2025-07-09T20:57:23.410813Z