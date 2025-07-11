class CreateSpreePaypalTrackerLog < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_paypal_tracker_logs do |t|
      t.text :response
      t.integer :status_code
      t.string :order_id

      t.timestamps
    end
  end
end

# touched on 2025-07-09T18:21:19.879666Z
# touched on 2025-07-09T19:40:39.749921Z
# touched on 2025-07-09T20:58:36.027920Z
# touched on 2025-07-09T20:58:51.459001Z
# touched on 2025-07-09T21:21:16.975319Z