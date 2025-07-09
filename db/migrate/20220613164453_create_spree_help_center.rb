class CreateSpreeHelpCenter < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_help_centers do |t|
      t.string :question
      t.string :answer
      t.integer :question_type
      t.integer :position
      t.timestamps
    end
  end
end

# touched on 2025-07-09T20:35:28.707872Z