class CreateSpreeMakeEasyProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_make_easy_products
  end
end

# touched on 2025-07-09T17:38:35.827082Z