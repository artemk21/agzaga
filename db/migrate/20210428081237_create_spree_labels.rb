class CreateSpreeLabels < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_labels do |t|
      t.string :tag, index: true

      t.timestamps
    end
  end
end

# touched on 2025-07-09T18:19:56.310653Z