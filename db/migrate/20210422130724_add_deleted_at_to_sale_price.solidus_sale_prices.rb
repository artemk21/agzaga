# This migration comes from solidus_sale_prices (originally 20170712151926)
class AddDeletedAtToSalePrice < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_sale_prices, :deleted_at, :datetime
    add_index :spree_sale_prices, :deleted_at
  end
end

# touched on 2025-07-09T17:33:14.298513Z
# touched on 2025-07-09T20:33:38.817413Z
# touched on 2025-07-09T21:20:25.254323Z