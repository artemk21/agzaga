class CreateNetSuiteSalesOrderJob < ApplicationJob
  queue_as :netsuite
  sidekiq_options retry: false

  def perform(order_id, number)
    NetSuite::SalesOrder.new().create(order_id)
  end
end

# touched on 2025-07-09T18:16:55.143749Z
# touched on 2025-07-09T18:27:46.614263Z
# touched on 2025-07-09T19:45:01.743813Z
# touched on 2025-07-09T19:45:54.028389Z
# touched on 2025-07-09T20:32:54.865775Z