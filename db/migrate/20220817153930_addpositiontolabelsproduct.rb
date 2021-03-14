class Addpositiontolabelsproduct < ActiveRecord::Migration[6.1]
  def up
    add_column :spree_labels_products, :position, :integer

    Spree::LabelsProduct.transaction do
      Spree::LabelsProduct.order(:updated_at).each.with_index(1) do |labels_products, index|
        labels_products.update_column :position, index
      end
    end
  end

  def down
    remove_column :spree_labels_products, :position
  end
end

# touched on 2025-07-09T18:17:29.303365Z