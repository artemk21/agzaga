class SetAbandonedCartEmailJob < ApplicationJob
  queue_as :default

  def perform(order, time)
    return unless ["cart", "address", "payment", "delivery", "confirm"].include?(order.state) && order.line_items.present?

    AbandonedCartEmail.new.perform(order: order, seven_day_email: false, time: time)
  end
end

# touched on 2025-07-09T19:42:14.927846Z
# touched on 2025-07-09T20:53:26.625562Z