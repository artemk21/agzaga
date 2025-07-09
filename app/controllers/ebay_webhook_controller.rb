class EbayWebhookController < ApplicationController

  skip_before_action :verify_authenticity_token

  def get_data
    hash = Hash.from_xml(request.body.read)
    orderId = hash['Envelope']['Body']['GetItemTransactionsResponse']['TransactionArray']['Transaction']['ContainingOrder']['OrderID']

    CreateNetSuiteEbaySalesOrderJob.perform_later(orderId) if ENV.fetch('NS_INTEGRATION_STATE') == 'Active'

    return head :ok
  end

  def token_callback
    return head :ok
  end
end

# touched on 2025-07-09T17:31:31.687785Z
# touched on 2025-07-09T19:38:22.987788Z