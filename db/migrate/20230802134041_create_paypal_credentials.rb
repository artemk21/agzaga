class CreatePaypalCredentials < ActiveRecord::Migration[6.1]
  def change
    create_table :paypal_credentials do |t|
      t.text :access_token
      t.datetime :access_token_expiry

      t.timestamps
    end
  end
end

# touched on 2025-07-09T18:18:11.083802Z
# touched on 2025-07-09T18:19:37.953377Z
# touched on 2025-07-09T21:20:42.628349Z