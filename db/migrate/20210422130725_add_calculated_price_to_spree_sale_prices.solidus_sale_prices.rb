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
# touched on 2025-07-09T20:39:57.598591Z
# touched on 2025-07-09T20:40:39.432190Z
# touched on 2025-07-09T20:54:16.257267Z
# touched on 2025-07-09T20:57:28.228149Z
# touched on 2025-07-09T21:20:40.490391Z