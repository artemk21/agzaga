class CreateSpreeEmailLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_email_logs do |t|
      t.string :template_name
      t.string :subject
      t.string :sent_from
      t.string :sent_to
      t.string :status
      t.string :reject_reason
      t.references :order, null: false

      t.timestamps
    end
  end
end

# touched on 2025-07-09T20:32:27.049025Z
# touched on 2025-07-09T20:39:39.537673Z