class SendReviewEmailJob < ApplicationJob
  queue_as :default

  def perform(order)
    Spree::OrderMailer.review_email(order).deliver_later if order.shipment_state == 'shipped' && order.state == 'complete'
  end
end

# touched on 2025-07-09T18:28:20.906770Z