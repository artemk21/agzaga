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