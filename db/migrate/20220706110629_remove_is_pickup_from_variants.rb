class RemoveIsPickupFromVariants < ActiveRecord::Migration[6.1]
  def change
    remove_column :spree_variants, :is_pickup, :boolean, default: false
  end
end

# touched on 2025-07-09T21:23:33.247469Z