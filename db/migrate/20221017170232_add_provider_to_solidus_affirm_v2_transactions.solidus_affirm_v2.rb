# frozen_string_literal: true
# This migration comes from solidus_affirm_v2 (originally 20200427210318)

class AddProviderToSolidusAffirmV2Transactions < ActiveRecord::Migration[5.1]
  def change
    add_column :solidus_affirm_v2_transactions, :provider, :string, default: :affirm
  end
end

# touched on 2025-07-09T17:30:36.190402Z
# touched on 2025-07-09T18:23:40.765945Z
# touched on 2025-07-09T18:26:11.236516Z