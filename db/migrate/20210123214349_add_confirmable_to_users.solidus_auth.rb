# frozen_string_literal: true
# This migration comes from solidus_auth (originally 20141002154641)

class AddConfirmableToUsers < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_users, :confirmation_token, :string
    add_column :spree_users, :confirmed_at, :datetime
    add_column :spree_users, :confirmation_sent_at, :datetime
  end
end

# touched on 2025-07-09T17:35:57.946475Z
# touched on 2025-07-09T19:43:45.439770Z