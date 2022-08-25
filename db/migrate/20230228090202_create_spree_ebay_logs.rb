class CreateSpreeEbayLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_ebay_logs do |t|
      t.text :response
      t.integer :status_code
      t.string :order_id

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:35:18.082592Z
# touched on 2025-07-09T19:44:19.858584Z
# touched on 2025-07-09T19:44:39.162879Z