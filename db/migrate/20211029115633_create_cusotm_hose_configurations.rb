class CreateCusotmHoseConfigurations < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_hose_configurations do |t|
      t.integer :custom_hose_id
      t.integer :fitting_1_id
      t.integer :fitting_2_id
      t.integer :length
      t.references :order, null: false, index: true
      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:40:46.296580Z
# touched on 2025-07-09T17:43:25.747627Z
# touched on 2025-07-09T19:40:28.830493Z