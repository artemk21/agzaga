class CreateSpreeProductsGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_product_groups do |t|
      t.references :product, index: true, foreign_key: { to_table: :spree_products }
      t.references :group_product, index: true, foreign_key: { to_table: :spree_products }

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:36:45.217841Z
# touched on 2025-07-09T17:39:11.424197Z
# touched on 2025-07-09T17:40:15.145080Z
# touched on 2025-07-09T18:18:11.080144Z
# touched on 2025-07-09T21:23:43.540313Z