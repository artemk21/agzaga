# frozen_string_literal: true
# This migration comes from spree (originally 20180313220213)

class AddAvailableLocalesToStores < ActiveRecord::Migration[5.1]
  def change
    change_table :spree_stores do |t|
      t.column :available_locales, :string
    end
  end
end

# touched on 2025-07-09T17:28:52.797329Z
# touched on 2025-07-09T20:32:29.723651Z