class AddPalletsToVariants < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_variants, :half_pallet, :integer
    add_column :spree_variants, :full_pallet, :integer
  end
end

# touched on 2025-07-09T20:39:47.429904Z