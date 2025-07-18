# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20110406083603)

class AddRatingToProducts < SolidusSupport::Migration[4.2]
  def self.up
    if table_exists?('products')
      add_column :products, :avg_rating, :decimal, default: 0.0, null: false, precision: 7, scale: 5
      add_column :products, :reviews_count, :integer, default: 0, null: false
    elsif table_exists?('spree_products')
      add_column :spree_products, :avg_rating, :decimal, default: 0.0, null: false, precision: 7, scale: 5
      add_column :spree_products, :reviews_count, :integer, default: 0, null: false
    end
  end

  def self.down
    if table_exists?('products')
      remove_column :products, :reviews_count
      remove_column :products, :avg_rating
    elsif table_exists?('spree_products')
      remove_column :spree_products, :reviews_count
      remove_column :spree_products, :avg_rating
    end
  end
end

# touched on 2025-07-09T18:14:46.371130Z
# touched on 2025-07-09T19:39:16.756089Z
# touched on 2025-07-09T19:39:49.923723Z
# touched on 2025-07-09T20:38:36.766615Z