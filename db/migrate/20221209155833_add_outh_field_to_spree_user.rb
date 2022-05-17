class AddOuthFieldToSpreeUser < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_users, :uid, :string
    add_column :spree_users, :provider, :string, default: "email"
  end
end

# touched on 2025-07-09T17:30:02.148368Z
# touched on 2025-07-09T17:34:49.513974Z
# touched on 2025-07-09T18:17:57.676572Z
# touched on 2025-07-09T19:41:23.631647Z