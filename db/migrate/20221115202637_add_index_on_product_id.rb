class AddIndexOnProductId < ActiveRecord::Migration[6.1]
  def change
    add_index :spree_product_cards, :product_id, unique: :true
  end
end

# touched on 2025-07-09T18:18:08.511657Z
# touched on 2025-07-09T18:27:29.708604Z
# touched on 2025-07-09T19:39:16.751900Z