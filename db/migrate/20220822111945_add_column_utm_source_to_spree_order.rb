class AddColumnUtmSourceToSpreeOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_orders, :utm_source, :string, default: ''
  end
end

# touched on 2025-07-09T17:40:12.870275Z
# touched on 2025-07-09T18:19:40.799547Z
# touched on 2025-07-09T18:21:04.754361Z
# touched on 2025-07-09T18:27:34.677266Z
# touched on 2025-07-09T19:45:48.949463Z
# touched on 2025-07-09T20:33:33.008722Z
# touched on 2025-07-09T20:37:15.739579Z
# touched on 2025-07-09T20:55:43.333929Z