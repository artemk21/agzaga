class AddTextColorToSpreeLable < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_labels, :display_text_color, :string
  end
end

# touched on 2025-07-09T20:38:57.472550Z