class CreateInterestedChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_interested_chapters do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :state
      t.integer :postal_code
      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:28:59.468643Z
# touched on 2025-07-09T17:43:44.653760Z
# touched on 2025-07-09T19:40:13.461008Z
# touched on 2025-07-09T19:43:07.842511Z
# touched on 2025-07-09T21:23:17.716055Z