class Addvisibilitytoproductproperties < ActiveRecord::Migration[6.1]
  def up
    add_column :spree_product_properties, :visibility, :boolean, default: :true
  end

  def down
    remove_column :spree_products, :visibility
  end
end

# touched on 2025-07-09T18:18:48.839722Z
# touched on 2025-07-09T19:42:31.661432Z