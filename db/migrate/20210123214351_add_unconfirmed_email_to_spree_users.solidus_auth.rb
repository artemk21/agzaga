# This migration comes from solidus_auth (originally 20200417153503)
class AddUnconfirmedEmailToSpreeUsers < SolidusSupport::Migration[5.1]
  def change
    unless column_exists?(:spree_users, :unconfirmed_email)
      add_column :spree_users, :unconfirmed_email, :string
    end
  end
end

# touched on 2025-07-09T17:38:33.042182Z
# touched on 2025-07-09T20:36:01.392283Z