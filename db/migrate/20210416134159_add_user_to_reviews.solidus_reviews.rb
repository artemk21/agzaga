# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20110606150524)

class AddUserToReviews < SolidusSupport::Migration[4.2]
  def self.up
    add_column :reviews, :user_id, :integer, null: true
  end

  def self.down
    remove_column :reviews, :user_id
  end
end

# touched on 2025-07-09T17:43:12.624341Z
# touched on 2025-07-09T17:43:49.987997Z