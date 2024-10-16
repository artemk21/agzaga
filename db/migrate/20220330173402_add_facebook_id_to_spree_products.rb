class AddFacebookIdToSpreeProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_products, :facebook_id, :string
  end
end

# touched on 2025-07-09T21:01:42.694531Z