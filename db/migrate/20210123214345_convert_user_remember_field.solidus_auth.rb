# frozen_string_literal: true
# This migration comes from solidus_auth (originally 20101214150824)

class ConvertUserRememberField < SolidusSupport::Migration[4.2]
  def up
    remove_column :spree_users, :remember_created_at
    add_column :spree_users, :remember_created_at, :datetime
  end

  def down
    remove_column :spree_users, :remember_created_at
    add_column :spree_users, :remember_created_at, :string
  end
end

# touched on 2025-07-09T17:39:08.842791Z
# touched on 2025-07-09T17:39:40.947239Z
# touched on 2025-07-09T18:16:29.768916Z
# touched on 2025-07-09T19:37:34.421876Z
# touched on 2025-07-09T19:46:23.912791Z
# touched on 2025-07-09T20:32:04.815757Z
# touched on 2025-07-09T20:34:56.052064Z
# touched on 2025-07-09T20:37:33.077438Z
# touched on 2025-07-09T20:37:46.204057Z