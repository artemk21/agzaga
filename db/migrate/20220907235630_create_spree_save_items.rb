class CreateSpreeSaveItems < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_save_items do |t|
      t.integer :user_id
      t.integer :variant_id
      t.integer :quantity
      t.index [:user_id, :variant_id], name: "spree_user_variant_join_index", unique: true
      t.timestamps
    end
  end
end

# touched on 2025-07-09T18:17:39.413186Z
# touched on 2025-07-09T20:57:03.813552Z
# touched on 2025-07-09T20:57:31.023078Z