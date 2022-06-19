class AddDropshipToSpreeVariants < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_variants, :is_dropship, :bool, default: :false
  end
end

# touched on 2025-07-09T19:42:35.428174Z