class AddCreatorNameToSpreeProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_products, :creator_name, :string
  end
end

# touched on 2025-07-09T19:40:42.286021Z