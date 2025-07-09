class AddFlagToSpreeTaxon < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_taxons, :visibility, :boolean, default: true
  end
end

# touched on 2025-07-09T17:31:09.067230Z