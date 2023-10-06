# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20110806093221)

class AddIpAddressToReviews < SolidusSupport::Migration[4.2]
  def self.up
    add_column :reviews, :ip_address, :string
  end

  def self.down
    remove_column :reviews, :ip_address
  end
end

# touched on 2025-07-09T19:42:59.291379Z
# touched on 2025-07-09T20:38:15.226242Z
# touched on 2025-07-09T20:41:15.830694Z