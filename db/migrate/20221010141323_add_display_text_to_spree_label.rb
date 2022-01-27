class AddDisplayTextToSpreeLabel < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_labels, :display_text, :string
  end
end

# touched on 2025-07-09T17:28:19.086299Z
# touched on 2025-07-09T18:27:49.637792Z
# touched on 2025-07-09T19:38:28.944374Z