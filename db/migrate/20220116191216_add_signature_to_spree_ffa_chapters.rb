class AddSignatureToSpreeFfaChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_ffa_chapters, :signature_request_id, :string
    add_column :spree_ffa_chapters, :is_signed, :boolean, default: false
  end
end

# touched on 2025-07-09T17:29:16.824019Z
# touched on 2025-07-09T18:24:05.679839Z
# touched on 2025-07-09T19:43:50.873577Z
# touched on 2025-07-09T20:35:08.425013Z