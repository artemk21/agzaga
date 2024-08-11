class CreateSpreeUpsellProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_upsell_products
  end
end

# touched on 2025-07-09T20:59:40.711111Z