class CreateSpreeTaxonWithOnSaleProducts < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_taxon_with_on_sale_products
  end
end

# touched on 2025-07-09T18:20:44.290851Z