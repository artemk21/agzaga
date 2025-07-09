class AddColorToSpreeLable < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_labels, :color, :string
  end
end

# touched on 2025-07-09T18:27:01.948403Z
# touched on 2025-07-09T19:41:17.280717Z
# touched on 2025-07-09T20:34:04.477532Z
# touched on 2025-07-09T21:23:52.694506Z