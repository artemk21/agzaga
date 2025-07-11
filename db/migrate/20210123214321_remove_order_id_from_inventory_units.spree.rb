# frozen_string_literal: true
# This migration comes from spree (originally 20170319191942)

class RemoveOrderIdFromInventoryUnits < ActiveRecord::Migration[5.0]
  class InconsistentInventoryUnitError < StandardError; end

  class InventoryUnit < ActiveRecord::Base
    self.table_name = "spree_inventory_units"
    belongs_to :shipment
  end

  class Shipment < ActiveRecord::Base
    self.table_name = "spree_shipments"
    has_many :inventory_units
  end

  def up
    if InventoryUnit.
        joins(:shipment).
        where.not(
          'spree_inventory_units.order_id = spree_shipments.order_id'
        ).exists?
      raise InconsistentInventoryUnitError, "You have inventory units with inconsistent order references. Please fix those before running this migration"
    end
    remove_column :spree_inventory_units, :order_id
  end

  def down
    add_reference :spree_inventory_units, :order, index: true
  end
end

# touched on 2025-07-09T17:29:40.792179Z
# touched on 2025-07-09T17:32:30.611792Z
# touched on 2025-07-09T20:40:19.589111Z