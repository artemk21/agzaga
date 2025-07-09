class RenameStatusToReponse < ActiveRecord::Migration[6.1]
  def change
    rename_column :spree_net_suite_logs, :status, :response
    add_column :spree_net_suite_logs, :status_code, :integer
  end
end

# touched on 2025-07-09T18:14:49.170181Z
# touched on 2025-07-09T19:42:38.272990Z