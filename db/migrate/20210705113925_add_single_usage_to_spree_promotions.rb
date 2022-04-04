class AddSingleUsageToSpreePromotions < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_promotions, :single_usage, :boolean, default: false
  end
end

# touched on 2025-07-09T17:42:56.627217Z
# touched on 2025-07-09T18:19:21.691681Z
# touched on 2025-07-09T19:40:26.267004Z