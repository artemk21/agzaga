class CreateSpreeLabelsProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_labels_products do |t|
      t.references :product
      t.references :label

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:43:47.361935Z
# touched on 2025-07-09T19:45:29.209479Z
# touched on 2025-07-09T20:34:13.748945Z
# touched on 2025-07-09T20:38:29.897249Z
# touched on 2025-07-09T20:56:58.320654Z