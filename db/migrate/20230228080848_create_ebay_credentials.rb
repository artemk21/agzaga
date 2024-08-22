class CreateEbayCredentials < ActiveRecord::Migration[6.1]
  def change
    create_table :ebay_credentials do |t|
      t.text :refresh_token
      t.text :access_token
      t.datetime :access_token_expiry

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:39:05.351771Z
# touched on 2025-07-09T18:19:13.083127Z
# touched on 2025-07-09T20:40:16.513778Z
# touched on 2025-07-09T20:59:59.198075Z