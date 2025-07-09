class CreateSpreeAvailableGiftProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_available_gift_products
  end
end

# touched on 2025-07-09T17:35:32.720249Z