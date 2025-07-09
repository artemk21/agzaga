class CreateSpreeTaxonWithOnSaleProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_taxon_with_on_sale_products
  end
end

# touched on 2025-07-09T18:20:44.290851Z
# touched on 2025-07-09T20:38:39.298927Z
# touched on 2025-07-09T21:22:14.306165Z