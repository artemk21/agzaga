# frozen_string_literal: true
# This migration comes from spree (originally 20160924135758)

class RemoveIsDefaultFromPrices < ActiveRecord::Migration[5.0]
  def change
    remove_column :spree_prices, :is_default, :boolean, default: true
  end
end

# touched on 2025-07-09T19:42:49.868951Z