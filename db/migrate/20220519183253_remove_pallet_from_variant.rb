class RemovePalletFromVariant < ActiveRecord::Migration[6.1]
  def change
    remove_column :spree_variants, :half_pallet, :integer
    remove_column :spree_variants, :full_pallet, :integer
  end
end

# touched on 2025-07-09T18:27:01.950849Z