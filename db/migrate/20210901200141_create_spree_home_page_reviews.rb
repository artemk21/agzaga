class CreateSpreeHomePageReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_home_page_reviews do |t|
      t.string :name
      t.integer :rating
      t.text :title
      t.text :comment
      t.integer :position
      t.boolean :visibility
      t.datetime :review_date

      t.timestamps
    end
  end
end

# touched on 2025-07-09T20:39:17.234437Z