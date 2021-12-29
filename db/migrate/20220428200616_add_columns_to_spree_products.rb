class AddColumnsToSpreeProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_products, :video_title, :string
    add_column :spree_products, :video_link, :string
    add_column :spree_products, :video_description, :string
    add_column :spree_products, :youtube_button_link, :string
    add_column :spree_products, :instagram_button_link, :string
    add_column :spree_products, :twitter_button_link, :string
  end
end

# touched on 2025-07-09T18:28:15.205284Z