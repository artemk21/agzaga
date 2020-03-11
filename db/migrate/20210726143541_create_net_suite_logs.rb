class CreateNetSuiteLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_net_suite_logs do |t|
      t.text :status
      t.references :order

      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:31:09.064702Z