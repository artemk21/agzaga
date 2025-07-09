class AddTrackingNumberNsToPaypalJob < ApplicationJob
  queue_as :paypal

  def perform (order_id,tracking_number,carrier)
    @order = Spree::Order.find_by(number:order_id.match( /PayPal:\s*(\w+)/)[1])
    capture_id = @order.payments.find_by(state: "completed").source.capture_id

    Paypal::PaypalTrackingNumberUpdate.new.create(order_id,capture_id,tracking_number,carrier)
  end
end

# touched on 2025-07-09T17:29:57.453031Z
# touched on 2025-07-09T17:30:25.770881Z