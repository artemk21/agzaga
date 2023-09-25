class CreateSpreeEbayChangeLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_ebay_change_logs do |t|
      t.string  :sku
      t.string  :field_name
      t.string  :old_value
      t.string  :new_value
      t.timestamps
    end
  end
end

# touched on 2025-07-09T20:41:01.014502Z