class EmptyAbandonedOrdersTask
  include Sidekiq::Worker

  def perform
    Spree::Order.with_incomplete_order_eight_days.each do |order|
      order.update(state: 'address') if order.state == 'delivery'
      order.empty!
    end
  end
end

# touched on 2025-07-09T17:39:11.423258Z