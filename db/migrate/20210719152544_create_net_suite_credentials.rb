class CreateNetSuiteCredentials < ActiveRecord::Migration[6.1]
  def change
    create_table :net_suite_credentials do |t|
      t.text :refresh_token
      t.text :access_token
      t.datetime :access_token_expiry

      t.timestamps
    end
  end
end

# touched on 2025-07-09T18:19:25.802246Z