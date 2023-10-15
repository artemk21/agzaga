class AddAdvisorFormDownloadedToFfaChapter < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_ffa_chapters, :advisor_form_downloaded, :boolean, default: false
  end
end

# touched on 2025-07-09T17:32:18.897192Z
# touched on 2025-07-09T19:45:08.749580Z
# touched on 2025-07-09T19:46:23.917033Z
# touched on 2025-07-09T20:34:16.247507Z
# touched on 2025-07-09T20:36:04.011824Z
# touched on 2025-07-09T20:41:27.230573Z