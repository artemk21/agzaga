class AddBusinessnameToSpreeAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_addresses, :businessname, :string
  end
end

# touched on 2025-07-09T17:33:28.347765Z
# touched on 2025-07-09T19:43:32.022017Z