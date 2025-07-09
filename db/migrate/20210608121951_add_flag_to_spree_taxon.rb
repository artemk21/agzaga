class AddFlagToSpreeTaxon < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_taxons, :visibility, :boolean, default: true
  end
end

# touched on 2025-07-09T17:31:09.067230Z
# touched on 2025-07-09T19:43:32.020250Z
# touched on 2025-07-09T19:44:04.075967Z
# touched on 2025-07-09T20:52:56.442772Z
# touched on 2025-07-09T21:00:59.361967Z