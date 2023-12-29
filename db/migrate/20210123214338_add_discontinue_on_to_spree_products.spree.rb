# frozen_string_literal: true
# This migration comes from spree (originally 20201008213609)

class AddDiscontinueOnToSpreeProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_products, :discontinue_on, :datetime
  end
end

# touched on 2025-07-09T17:42:21.951733Z
# touched on 2025-07-09T18:21:14.079872Z
# touched on 2025-07-09T20:54:23.422752Z