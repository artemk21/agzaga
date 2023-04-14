# This migration comes from solidus_sale_prices (originally 20140309000000)
class ChangeDataTypeForValue < SolidusSupport::Migration[4.2]
  def change
    change_column :spree_sale_prices, :value, :decimal, precision: 10, scale: 2, null: false
  end
end


# touched on 2025-07-09T18:17:32.546612Z
# touched on 2025-07-09T19:45:54.029230Z
# touched on 2025-07-09T20:37:36.261942Z