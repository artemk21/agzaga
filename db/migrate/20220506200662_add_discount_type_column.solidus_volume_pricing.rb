# frozen_string_literal: true
# This migration comes from solidus_volume_pricing (originally 20121115043422)

class AddDiscountTypeColumn < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_volume_prices, :discount_type, :string
  end
end

# touched on 2025-07-09T17:37:45.772656Z
# touched on 2025-07-09T18:14:55.672338Z