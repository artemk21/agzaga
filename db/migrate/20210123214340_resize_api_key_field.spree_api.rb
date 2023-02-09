# frozen_string_literal: true
# This migration comes from spree_api (originally 20120411123334)

class ResizeApiKeyField < ActiveRecord::Migration[4.2]
  def up
    unless defined?(User)
      change_column :spree_users, :api_key, :string, limit: 48
    end
  end
end

# touched on 2025-07-09T17:40:46.297785Z
# touched on 2025-07-09T20:35:08.424170Z