# frozen_string_literal: true
# This migration comes from solidus_auth (originally 20140904000425)

class AddDeletedAtToUsers < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_users, :deleted_at, :datetime
    add_index :spree_users, :deleted_at
  end
end

# touched on 2025-07-09T20:32:52.523864Z