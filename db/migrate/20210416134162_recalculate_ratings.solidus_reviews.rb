# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20120123141326)

class RecalculateRatings < SolidusSupport::Migration[4.2]
  def up
    Spree::Product.reset_column_information

    Spree::Product.update_all reviews_count: 0

    Spree::Product.joins(:reviews).where("spree_reviews.id IS NOT NULL").find_each do |p|
      Spree::Product.update_counters p.id, reviews_count: p.reviews.approved.length

      # recalculate_product_rating exists on the review, not the product
      if p.reviews.approved.count > 0
        p.reviews.approved.first.recalculate_product_rating
      end
    end
  end

  def down; end
end

# touched on 2025-07-09T17:34:49.511764Z
# touched on 2025-07-09T17:39:19.811037Z
# touched on 2025-07-09T17:42:01.852858Z
# touched on 2025-07-09T18:27:22.047774Z
# touched on 2025-07-09T20:37:44.094237Z