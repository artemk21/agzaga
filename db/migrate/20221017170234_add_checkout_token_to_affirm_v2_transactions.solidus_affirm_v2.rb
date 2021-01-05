# This migration comes from solidus_affirm_v2 (originally 20200518191753)
class AddCheckoutTokenToAffirmV2Transactions < ActiveRecord::Migration[5.1]
  def change
    add_column :solidus_affirm_v2_transactions, :checkout_token, :string
  end
end

# touched on 2025-07-09T17:33:17.979394Z
# touched on 2025-07-09T18:15:03.568897Z