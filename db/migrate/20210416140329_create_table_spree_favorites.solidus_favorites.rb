# frozen_string_literal: true
# This migration comes from solidus_favorites (originally 20190624204433)

class CreateTableSpreeFavorites < SolidusSupport::Migration[5.1]
  def change
    create_table :spree_favorites do |t|
      t.belongs_to :favorable, polymorphic: true
      t.belongs_to :user, index: true
      t.string :guest_token
      t.timestamps
    end

    add_index :spree_favorites, [:favorable_id, :favorable_type]
    add_index :spree_favorites, :guest_token
  end
end

# touched on 2025-07-09T17:34:52.283566Z
# touched on 2025-07-09T17:40:46.293604Z
# touched on 2025-07-09T17:44:21.552631Z