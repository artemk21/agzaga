# frozen_string_literal: true
# This migration comes from spree (originally 20161014221052)

class AddAvailableToColumnsAndRemoveDisplayOnFromPaymentMethods < ActiveRecord::Migration[5.0]
  def up
    add_column(:spree_payment_methods, :available_to_users, :boolean, default: true)
    add_column(:spree_payment_methods, :available_to_admin, :boolean, default: true)
    execute("UPDATE spree_payment_methods "\
             "SET available_to_users=#{quoted_false} "\
             "WHERE NOT (display_on='front_end' OR display_on='' OR display_on IS NULL)")
    execute("UPDATE spree_payment_methods "\
             "SET available_to_admin=#{quoted_false} "\
             "WHERE NOT (display_on='back_end' OR display_on='' OR display_on IS NULL)")
    remove_column(:spree_payment_methods, :display_on)
  end

  def down
    add_column(:spree_payment_methods, :display_on, :string)
    execute("UPDATE spree_payment_methods "\
            "SET display_on='' "\
            "WHERE (available_to_users=#{quoted_true} AND available_to_admin=#{quoted_true})")
    execute("UPDATE spree_payment_methods "\
            "SET display_on='front_end' "\
            "WHERE (available_to_users=#{quoted_true} AND NOT available_to_admin=#{quoted_true})")
    execute("UPDATE spree_payment_methods "\
            "SET display_on='back_end' "\
            "WHERE (available_to_admin=#{quoted_true} AND NOT available_to_users=#{quoted_true})")
    remove_column(:spree_payment_methods, :available_to_users)
    remove_column(:spree_payment_methods, :available_to_admin)
  end
end

# touched on 2025-07-09T20:32:57.609097Z
# touched on 2025-07-09T20:54:12.494455Z
# touched on 2025-07-09T20:56:18.100446Z
# touched on 2025-07-09T21:23:07.530767Z