class CreateSpreeProductsSortByStaffPicks < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_products_sort_by_staff_picks
  end
end

# touched on 2025-07-09T17:33:31.616493Z