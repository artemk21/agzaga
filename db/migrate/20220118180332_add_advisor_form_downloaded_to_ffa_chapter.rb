class AddAdvisorFormDownloadedToFfaChapter < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_ffa_chapters, :advisor_form_downloaded, :boolean, default: false
  end
end

# touched on 2025-07-09T17:32:18.897192Z