# frozen_string_literal: true
# This migration comes from spree (originally 20170223235001)

class RemoveSpreeStoreCreditsColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :spree_store_credits, :spree_store_credits, :datetime
  end
end

# touched on 2025-07-09T18:17:18.641717Z
# touched on 2025-07-09T18:18:04.330904Z
# touched on 2025-07-09T19:44:22.206468Z
# touched on 2025-07-09T20:35:50.535324Z