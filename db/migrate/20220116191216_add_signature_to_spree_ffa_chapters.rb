class AddSignatureToSpreeFfaChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_ffa_chapters, :signature_request_id, :string
    add_column :spree_ffa_chapters, :is_signed, :boolean, default: false
  end
end

# touched on 2025-07-09T17:29:16.824019Z