class CreateNsResponse < ActiveRecord::Migration[6.1]
  def change
    create_table :ns_responses do |t|
      t.string :response
      t.timestamps
    end
  end
end

# touched on 2025-07-09T17:31:31.691078Z
# touched on 2025-07-09T18:16:01.030901Z
# touched on 2025-07-09T18:19:13.079983Z
# touched on 2025-07-09T19:42:59.286820Z