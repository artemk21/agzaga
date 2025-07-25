class CreateSpreeLookup < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_product_cards do |t|
      t.string :name
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2, default: "0.0"
      t.decimal :original_price, precision: 10, scale: 2, null: true
      t.boolean :on_sale, default: :false
      t.string :label_text
      t.string :label_color
      t.datetime :sale_ends_at
      t.integer :product_id
      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:31:51.858464Z
# touched on 2025-07-09T19:38:44.985904Z
# touched on 2025-07-09T20:37:41.429756Z
# touched on 2025-07-09T20:57:31.018357Z