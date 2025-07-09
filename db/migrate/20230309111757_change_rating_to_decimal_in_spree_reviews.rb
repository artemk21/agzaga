class ChangeRatingToDecimalInSpreeReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :spree_reviews, :rating, :decimal, precision: 3, scale: 2
  end
end

# touched on 2025-07-09T17:35:47.575602Z