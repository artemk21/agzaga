class AddSlugToSpreeProductCard < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_product_cards, :slug, :string
  end
end

# touched on 2025-07-09T20:59:50.837660Z