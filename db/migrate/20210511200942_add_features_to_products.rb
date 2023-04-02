class AddFeaturesToProducts < ActiveRecord::Migration[6.1]
  def up
    add_column :spree_products, :features, :text
  end

  def down
    remove_column :spree_products, :features
  end
end

# touched on 2025-07-09T18:27:11.539421Z
# touched on 2025-07-09T19:39:08.292423Z
# touched on 2025-07-09T20:37:15.739795Z