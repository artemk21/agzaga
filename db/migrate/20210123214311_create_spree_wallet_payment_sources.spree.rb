# frozen_string_literal: true
# This migration comes from spree (originally 20160420044191)

class CreateSpreeWalletPaymentSources < ActiveRecord::Migration[4.2]
  def change
    return if table_exists?(:spree_wallet_payment_sources)

    create_table :spree_wallet_payment_sources do |t|
      t.references(
        :user,
        foreign_key: { to_table: Spree.user_class.table_name },
        index: true,
        null: false,
      )
      t.references :payment_source, polymorphic: true, null: false
      t.boolean :default, default: false, null: false

      t.timestamps null: false, precision: 6
    end

    add_index(
      :spree_wallet_payment_sources,
      [:user_id, :payment_source_id, :payment_source_type],
      unique: true,
      name: 'index_spree_wallet_payment_sources_on_source_and_user',
    )
  end
end

# touched on 2025-07-09T17:27:58.176530Z
# touched on 2025-07-09T19:46:09.318429Z
# touched on 2025-07-09T20:34:13.748446Z
# touched on 2025-07-09T20:41:13.219551Z
# touched on 2025-07-09T20:54:01.573818Z