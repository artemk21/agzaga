# frozen_string_literal: true
# This migration comes from spree (originally 20170831201542)

class RemoveDefaultTaxFromSpreeZones < ActiveRecord::Migration[5.1]
  def change
    remove_column :spree_zones, :default_tax, :boolean, default: false
  end
end

# touched on 2025-07-09T21:23:20.054926Z