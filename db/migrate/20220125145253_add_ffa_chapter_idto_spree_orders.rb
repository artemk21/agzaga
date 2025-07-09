class AddFfaChapterIdtoSpreeOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :ffa_chapter_id, :integer, null: true, index: true
    add_index  :spree_orders, :ffa_chapter_id
  end
end

# touched on 2025-07-09T17:35:20.679792Z
# touched on 2025-07-09T17:40:32.144906Z
# touched on 2025-07-09T18:19:50.544180Z