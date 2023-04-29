# frozen_string_literal: true
# This migration comes from solidus_tax_cloud (originally 20140623225628)

class AddTicToProducts < ActiveRecord::Migration[4.2]
  def up
    add_column :spree_products, :tax_cloud_tic, :string, default: nil
  end

  def down
    remove_column :spree_products, :tax_cloud_tic
  end
end

# touched on 2025-07-09T17:31:31.689902Z
# touched on 2025-07-09T18:23:53.222259Z
# touched on 2025-07-09T19:43:50.873065Z
# touched on 2025-07-09T20:37:53.389173Z