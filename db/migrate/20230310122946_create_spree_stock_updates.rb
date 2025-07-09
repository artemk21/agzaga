class CreateSpreeStockUpdates < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_stock_updates do |t|
      t.string :email
      t.boolean :process, default: false
      t.integer :variant_id

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:33:00.609970Z
# touched on 2025-07-09T17:44:30.703089Z
# touched on 2025-07-09T18:17:52.811117Z
# touched on 2025-07-09T20:36:06.514133Z
# touched on 2025-07-09T20:37:38.720080Z