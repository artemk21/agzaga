# frozen_string_literal: true
# This migration comes from solidus_volume_pricing (originally 20081119145604)

class CreateVolumePrices < ActiveRecord::Migration[4.2]
  def self.up
    create_table :volume_prices do |t|
      t.references :variant
      t.string :display
      t.string :range
      t.decimal :amount, precision: 8, scale: 2
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :volume_prices
  end
end

# touched on 2025-07-09T19:44:58.429402Z
# touched on 2025-07-09T20:39:20.373412Z
# touched on 2025-07-09T20:40:26.677266Z
# touched on 2025-07-09T20:58:42.433775Z