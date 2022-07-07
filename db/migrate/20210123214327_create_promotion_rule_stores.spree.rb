# frozen_string_literal: true
# This migration comes from spree (originally 20180202190713)

class CreatePromotionRuleStores < ActiveRecord::Migration[5.1]
  def change
    create_table :spree_promotion_rules_stores do |t|
      t.references :store, null: false
      t.references :promotion_rule, null: false

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:42:42.405316Z
# touched on 2025-07-09T19:42:56.296396Z