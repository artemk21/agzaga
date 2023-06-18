module Spree
  class PaypalTrackingNumberSyncsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      data = JSON.parse(params[:paypal_data])
      order_id = data['orderid']
      tracking_number = data['tracking_number']
      carrier = data['carrier']
      AddTrackingNumberNsToPaypalJob.perform_now(order_id,tracking_number,carrier)
      render json: {data: 'Paypal tracking number sync post call Received'}.to_json, status: 200
    end

  end
end

# touched on 2025-07-09T20:38:57.474679Z