class CreateNetSuiteSalesOrderJob < ApplicationJob
  queue_as :netsuite
  sidekiq_options retry: false

  def perform(order_id, number)
    NetSuite::SalesOrder.new().create(order_id)
  end
end

# touched on 2025-07-09T18:16:55.143749Z