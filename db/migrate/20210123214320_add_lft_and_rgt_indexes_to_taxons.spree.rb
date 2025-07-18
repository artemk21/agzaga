# frozen_string_literal: true
# This migration comes from spree (originally 20170317035819)

class AddLftAndRgtIndexesToTaxons < ActiveRecord::Migration[5.0]
  def change
    add_index :spree_taxons, :lft
    add_index :spree_taxons, :rgt
  end
end

# touched on 2025-07-09T18:17:18.640366Z
# touched on 2025-07-09T20:39:23.270055Z