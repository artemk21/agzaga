class CreateAddsOnsProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_adds_ons_products do |t|
      t.references :product
      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:43:12.621052Z
# touched on 2025-07-09T18:26:08.244488Z