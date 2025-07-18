# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20190613165528)

class AddVerifiedPurchaserToReviews < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_reviews, :verified_purchaser, :boolean, default: false
  end
end

# touched on 2025-07-09T19:44:24.393276Z
# touched on 2025-07-09T20:32:59.735434Z
# touched on 2025-07-09T20:59:33.754257Z
# touched on 2025-07-09T21:00:13.043051Z
# touched on 2025-07-09T21:23:15.532709Z