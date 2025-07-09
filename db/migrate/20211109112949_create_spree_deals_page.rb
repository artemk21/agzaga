class CreateSpreeDealsPage < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_deals_pages do |t|
      t.string :title
      t.string :description
      t.string :tag
      t.boolean :visibility

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:28:04.098661Z
# touched on 2025-07-09T17:31:11.733810Z
# touched on 2025-07-09T20:59:50.838615Z
# touched on 2025-07-09T21:22:21.654279Z