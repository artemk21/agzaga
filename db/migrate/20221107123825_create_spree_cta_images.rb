class CreateSpreeCtaImages < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_cta_images do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.string :desktop_link
      t.string :tab_link
      t.string :mobile_link
      t.string :redirect_to
      t.integer :position
      t.integer :add_space

      t.timestamps
    end
  end
end

# touched on 2025-07-09T19:38:15.135840Z
# touched on 2025-07-09T21:22:56.982222Z