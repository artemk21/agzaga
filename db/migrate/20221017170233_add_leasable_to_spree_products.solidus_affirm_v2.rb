# frozen_string_literal: true
# This migration comes from solidus_affirm_v2 (originally 20200427211845)

class AddLeasableToSpreeProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_products, :leasable, :boolean, default: false
  end
end

# touched on 2025-07-09T17:40:43.583947Z