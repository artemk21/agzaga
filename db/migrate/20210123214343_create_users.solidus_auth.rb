# frozen_string_literal: true
# This migration comes from solidus_auth (originally 20101026184949)

class CreateUsers < SolidusSupport::Migration[4.2]
  def up
    unless table_exists?("spree_users")
      create_table "spree_users", force: true do |t|
        t.string   "crypted_password",          limit: 128
        t.string   "salt",                      limit: 128
        t.string   "email"
        t.string   "remember_token"
        t.string   "remember_token_expires_at"
        t.string   "persistence_token"
        t.string   "single_access_token"
        t.string   "perishable_token"
        t.integer  "login_count",                              default: 0, null: false
        t.integer  "failed_login_count",                       default: 0, null: false
        t.datetime "last_request_at"
        t.datetime "current_login_at"
        t.datetime "last_login_at"
        t.string   "current_login_ip"
        t.string   "last_login_ip"
        t.string   "login"
        t.integer  "ship_address_id"
        t.integer  "bill_address_id"
        t.datetime "created_at",                                              null: false
        t.datetime "updated_at",                                              null: false
        t.string   "openid_identifier"
      end
    end
  end
end

# touched on 2025-07-09T18:20:12.243868Z
# touched on 2025-07-09T18:21:27.370680Z
# touched on 2025-07-09T18:26:33.602204Z
# touched on 2025-07-09T19:41:39.598874Z
# touched on 2025-07-09T21:22:19.485292Z
# touched on 2025-07-09T21:22:31.358886Z