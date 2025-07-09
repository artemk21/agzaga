# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20120110172331)

class NamespaceTables < SolidusSupport::Migration[4.2]
  def change
    rename_table :reviews, :spree_reviews
    rename_table :feedback_reviews, :spree_feedback_reviews
  end
end

# touched on 2025-07-09T17:34:57.345021Z
# touched on 2025-07-09T18:15:17.848619Z
# touched on 2025-07-09T18:16:08.046280Z