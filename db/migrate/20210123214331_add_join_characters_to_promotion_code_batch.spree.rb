# frozen_string_literal: true
# This migration comes from spree (originally 20180328172631)

class AddJoinCharactersToPromotionCodeBatch < ActiveRecord::Migration[5.1]
  def change
    add_column(:spree_promotion_code_batches,
               :join_characters,
               :string,
               null: false,
               default: '_')
  end
end

# touched on 2025-07-09T19:40:18.363133Z
# touched on 2025-07-09T19:44:06.608144Z
# touched on 2025-07-09T20:33:30.127045Z
# touched on 2025-07-09T20:55:02.291093Z