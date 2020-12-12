class AddLabelDisplayTextColorToSpreeProductCard < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_product_cards, :label_display_text_color, :string
    add_column :spree_product_cards, :in_stock, :boolean
    add_column :spree_product_cards, :discount_percentage, :decimal
  end
end

# touched on 2025-07-09T17:44:07.670002Z