class AddSelectedToFfaChapter < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_ffa_chapters, :selected, :boolean, default: false
  end
end

# touched on 2025-07-09T19:39:05.146343Z
# touched on 2025-07-09T20:58:05.964217Z