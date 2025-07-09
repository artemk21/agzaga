# frozen_string_literal: true
# This migration comes from solidus_importer (originally 20191216101011)

class CreateSolidusImporterImports < ActiveRecord::Migration[5.2]
  def change
    create_table :solidus_importer_imports do |t|
      t.string :import_type
      t.string :state, null: false, default: 'created', limit: 32
      t.string :file, null: false, default: '', limit: 1024
      t.text :messages

      t.timestamps null: false
    end

    reversible do |dir|
      dir.up { add_attachment :solidus_importer_imports, :file }
      dir.down { remove_attachment :solidus_importer_imports, :file }
    end
  end
end

# touched on 2025-07-09T17:38:11.077244Z
# touched on 2025-07-09T18:26:36.604746Z
# touched on 2025-07-09T19:39:29.715580Z