# frozen_string_literal: true
# This migration comes from solidus_affirm_v2 (originally 20200425205218)

class AddSolidusAffirmV2Transaction < ActiveRecord::Migration[5.1]
  def change
    create_table :solidus_affirm_v2_transactions do |t|
      t.string :transaction_id
      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:34:12.428336Z