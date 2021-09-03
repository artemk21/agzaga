# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20120712182514)

class AddLocaleToReviews < SolidusSupport::Migration[4.2]
  def self.up
    add_column :spree_reviews, :locale, :string, default: 'en'
  end

  def self.down
    remove_column :spree_reviews, :locale
  end
end

# touched on 2025-07-09T18:24:46.806353Z