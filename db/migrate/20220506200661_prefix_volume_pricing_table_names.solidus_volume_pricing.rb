# frozen_string_literal: true
# This migration comes from solidus_volume_pricing (originally 20111206173307)

class PrefixVolumePricingTableNames < ActiveRecord::Migration[4.2]
  def change
    rename_table :volume_prices, :spree_volume_prices unless Spree::VolumePrice.table_exists?
  end
end

# touched on 2025-07-09T17:35:15.458512Z
# touched on 2025-07-09T19:44:41.630404Z
# touched on 2025-07-09T20:35:19.058556Z
# touched on 2025-07-09T20:58:51.457379Z