# frozen_string_literal: true
# This migration comes from spree_api (originally 20131017162334)

class AddIndexToUserSpreeApiKey < ActiveRecord::Migration[4.2]
  def change
    unless defined?(User)
      add_index :spree_users, :spree_api_key
    end
  end
end

# touched on 2025-07-09T17:36:19.500182Z
# touched on 2025-07-09T17:38:38.507805Z
# touched on 2025-07-09T17:39:02.839549Z
# touched on 2025-07-09T19:41:04.408880Z
# touched on 2025-07-09T20:35:36.524859Z
# touched on 2025-07-09T20:55:35.453987Z
# touched on 2025-07-09T21:24:00.457900Z