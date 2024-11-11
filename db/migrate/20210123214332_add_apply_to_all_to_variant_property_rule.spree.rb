# frozen_string_literal: true
# This migration comes from spree (originally 20180416083007)

class AddApplyToAllToVariantPropertyRule < ActiveRecord::Migration[5.1]
  def up
    add_column :spree_variant_property_rules, :apply_to_all, :boolean, default: false, null: false
    change_column :spree_variant_property_rules, :apply_to_all, :boolean, default: true
  end

  def down
    remove_column :spree_variant_property_rules, :apply_to_all
  end
end

# touched on 2025-07-09T17:42:10.587687Z
# touched on 2025-07-09T20:35:11.312641Z
# touched on 2025-07-09T21:20:57.748527Z