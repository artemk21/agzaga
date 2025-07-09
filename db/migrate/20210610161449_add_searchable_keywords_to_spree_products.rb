class AddSearchableKeywordsToSpreeProducts < ActiveRecord::Migration[6.1]
  def up
    add_column :spree_products, :searchable_keywords, :string
  end

  def down
    remove_column :spree_products, :searchable_keywords
  end
end

# touched on 2025-07-09T19:40:48.055950Z
# touched on 2025-07-09T20:54:35.436241Z
# touched on 2025-07-09T21:00:25.774600Z