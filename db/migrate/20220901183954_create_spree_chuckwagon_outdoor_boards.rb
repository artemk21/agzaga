class CreateSpreeChuckwagonOutdoorBoards < ActiveRecord::Migration[6.1]
  def change
    create_view :spree_chuckwagon_outdoor_boards
  end
end

# touched on 2025-07-09T17:29:16.818315Z