class AddAddsOnIdField < ActiveRecord::Migration[6.1]
  def change
    add_reference :spree_adds_ons_products, :add_on, references: :spree_products, foreign_key: { to_table: :spree_products }
  end
end

# touched on 2025-07-09T18:18:23.660981Z
# touched on 2025-07-09T18:21:19.880407Z