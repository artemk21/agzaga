# frozen_string_literal: true
# This migration comes from solidus_importer (originally 20191216101012)

class CreateSolidusImporterRows < ActiveRecord::Migration[5.2]
  def change
    create_table :solidus_importer_rows do |t|
      t.belongs_to :import
      t.string :state, null: false, default: 'created', limit: 32
      t.text :data
      t.text :messages

      t.timestamps null: false
    end
  end
end

# touched on 2025-07-09T19:41:17.278365Z
# touched on 2025-07-09T20:57:10.070531Z