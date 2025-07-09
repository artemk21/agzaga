class CreateSpreeStoreCreditWinner < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_store_credit_winners do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.timestamps
    end
  end
end

# touched on 2025-07-09T18:21:07.540508Z
# touched on 2025-07-09T19:45:16.039037Z
# touched on 2025-07-09T20:40:41.901405Z
# touched on 2025-07-09T21:22:52.216579Z