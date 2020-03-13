class CreateNsResponse < ActiveRecord::Migration[6.1]
  def change
    create_table :ns_responses do |t|
      t.string :response
      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:31:31.691078Z