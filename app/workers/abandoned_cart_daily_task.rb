class AbandonedCartDailyTask
  include Sidekiq::Worker

  def perform(order: nil, seven_day_email: true, time: nil)
    Spree::Order.with_incomplete_order_seven_days.each do |order|
      begin
        AbandonedCartEmail.new.perform(order: order, seven_day_email: true, time: time)
      rescue Exception => e
        puts e
      end
    end
  end
end

# touched on 2025-07-09T17:38:18.653211Z
# touched on 2025-07-09T19:39:13.269778Z