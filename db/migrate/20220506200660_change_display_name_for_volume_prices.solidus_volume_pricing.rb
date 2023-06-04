# frozen_string_literal: true
# This migration comes from solidus_volume_pricing (originally 20110203174010)

class ChangeDisplayNameForVolumePrices < ActiveRecord::Migration[4.2]
  def self.up
    rename_column :volume_prices, :display, :name
  end

  def self.down
    rename_column :volume_prices, :name, :display
  end
end

# touched on 2025-07-09T19:43:56.098627Z
# touched on 2025-07-09T20:38:32.349770Z