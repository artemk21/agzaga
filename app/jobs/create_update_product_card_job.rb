class CreateUpdateProductCardJob < ApplicationJob
  queue_as :productcard

  def perform product_id
    Spree::Product.find(product_id).create_or_update_product_card
  end
end

# touched on 2025-07-09T17:33:25.892322Z
# touched on 2025-07-09T17:34:46.922175Z