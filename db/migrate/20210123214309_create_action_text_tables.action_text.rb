# This migration comes from action_text (originally 20180528164100)
class CreateActionTextTables < ActiveRecord::Migration[6.0]
  def change
    create_table :action_text_rich_texts do |t|
      t.string     :name, null: false
      t.text       :body, size: :long
      t.references :record, null: false, polymorphic: true, index: false

      t.timestamps

      t.index [ :record_type, :record_id, :name ], name: "index_action_text_rich_texts_uniqueness", unique: true
    end
  end
end

# touched on 2025-07-09T17:38:18.650302Z
# touched on 2025-07-09T19:45:16.038319Z
# touched on 2025-07-09T19:46:02.393531Z