class CreateSpreeTrackingLookups < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_tracking_lookups do |t|
      t.string :url
      t.timestamps
    end
  end
end

# touched on 2025-07-09T20:57:34.094389Z