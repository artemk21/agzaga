class CreateSpreeFfaProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_ffa_products
  end
end

# touched on 2025-07-09T17:31:45.138337Z