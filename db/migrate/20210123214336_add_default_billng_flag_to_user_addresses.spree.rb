# frozen_string_literal: true
# This migration comes from spree (originally 20200320144521)
class AddDefaultBillngFlagToUserAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_user_addresses, :default_billing, :boolean, default: false
  end
end

# touched on 2025-07-09T18:16:37.026361Z
# touched on 2025-07-09T18:21:07.538550Z
# touched on 2025-07-09T19:45:11.338079Z