class AddFlagToSpreeTaxonomies < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_taxonomies, :visibility, :boolean, default: true
  end
end

# touched on 2025-07-09T18:21:55.142191Z
# touched on 2025-07-09T20:31:44.777060Z
# touched on 2025-07-09T21:21:19.806176Z