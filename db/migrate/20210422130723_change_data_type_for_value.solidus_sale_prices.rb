# This migration comes from solidus_sale_prices (originally 20140309000000)
class ChangeDataTypeForValue < SolidusSupport::Migration[4.2]
  def change
    change_column :spree_sale_prices, :value, :decimal, precision: 10, scale: 2, null: false
  end
end


# touched on 2025-07-09T18:17:32.546612Z