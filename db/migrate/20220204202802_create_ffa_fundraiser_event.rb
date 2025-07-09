class CreateFfaFundraiserEvent < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_ffa_fundraiser_events do |t|
      t.boolean :is_active, default: false
      t.integer :started_by_id, null: true
      t.integer :ended_by_id, null: true
      t.datetime :ended_at
      t.timestamps
    end
  end
end

# touched on 2025-07-09T20:37:53.393094Z
# touched on 2025-07-09T20:38:15.227606Z