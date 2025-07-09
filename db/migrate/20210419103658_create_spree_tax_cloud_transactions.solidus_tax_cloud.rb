# frozen_string_literal: true
# This migration comes from solidus_tax_cloud (originally 20121220192438)

class CreateSpreeTaxCloudTransactions < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_tax_cloud_transactions do |t|
      t.references :order
      t.string :message

      t.timestamps null: false
    end
    add_index :spree_tax_cloud_transactions, :order_id
  end
end

# touched on 2025-07-09T18:17:13.784758Z