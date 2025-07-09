# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20101222083309)

class CreateFeedbackReviews < SolidusSupport::Migration[4.2]
  def self.up
    create_table :feedback_reviews do |t|
      t.integer :user_id
      t.integer :review_id, null: false
      t.integer :rating,    default: 0
      t.text    :comment
      t.timestamps
    end
    add_index :feedback_reviews, :review_id
    add_index :feedback_reviews, :user_id
  end

  def self.down
    drop_table :feedback_reviews
  end
end

# touched on 2025-07-09T18:15:10.498862Z
# touched on 2025-07-09T20:35:03.496308Z
# touched on 2025-07-09T21:20:32.709795Z