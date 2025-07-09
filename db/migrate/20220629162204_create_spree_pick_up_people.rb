class CreateSpreePickUpPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_pick_up_people do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :order_id

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:38:46.744954Z
# touched on 2025-07-09T19:42:38.266886Z