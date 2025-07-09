# frozen_string_literal: true
# This migration comes from solidus_tax_cloud (originally 20130829215819)

class FixScaleOfCartItemPrices < ActiveRecord::Migration[4.2]
  def up
    change_column :spree_tax_cloud_cart_items, :price,      :decimal, precision: 8,  scale: 2
    change_column :spree_tax_cloud_cart_items, :ship_total, :decimal, precision: 10, scale: 2
    change_column :spree_tax_cloud_cart_items, :amount,     :decimal, precision: 13, scale: 5
  end

  def down
    change_column :spree_tax_cloud_cart_items, :price,      :decimal, precision: 8, scale: 5
    change_column :spree_tax_cloud_cart_items, :ship_total, :decimal, precision: 8, scale: 5
    change_column :spree_tax_cloud_cart_items, :amount,     :decimal, precision: 8, scale: 5
  end
end

# touched on 2025-07-09T17:28:59.471805Z
# touched on 2025-07-09T21:20:53.048322Z