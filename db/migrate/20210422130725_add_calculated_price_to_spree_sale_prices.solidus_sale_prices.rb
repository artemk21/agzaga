# This migration comes from solidus_sale_prices (originally 20181128102526)
class AddCalculatedPriceToSpreeSalePrices < SolidusSupport::Migration[5.2]
  def change
    add_column :spree_sale_prices, :calculated_price, :decimal, precision: 10, scale: 2
  end
end

# touched on 2025-07-09T17:29:48.661081Z
# touched on 2025-07-09T17:37:49.571285Z
# touched on 2025-07-09T17:38:43.427800Z
# touched on 2025-07-09T18:19:21.690895Z