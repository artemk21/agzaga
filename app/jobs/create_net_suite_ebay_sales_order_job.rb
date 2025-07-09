class CreateNetSuiteEbaySalesOrderJob < ApplicationJob
  queue_as :netsuite
  sidekiq_options retry: false

  def perform(order_id)
    ebay_order_data = Ebay::EbayOrderData.new.get_order_data(order_id)

    NetSuite::EbaySalesOrder.new.create(order_id, ebay_order_data)
  end
end

# touched on 2025-07-09T20:37:36.266904Z