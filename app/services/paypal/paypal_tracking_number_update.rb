module Paypal
  class PaypalTrackingNumberUpdate < Base

    def initialize
      super
      @tracker_batch = 'https://api-m.paypal.com/v1/shipping/trackers'
    end

    def create(order_id,capture_id,tracking_number,carrier)

      url = URI(@tracker_batch)

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/json"
      request["X-PAYPAL-SECURITY-CONTEXT"] = ""

      request.body = JSON.dump({
        "trackers": [
          {
            "transaction_id": capture_id,
            "status": "SHIPPED",
            "tracking_number": tracking_number,
            "carrier": carrier
          }
        ]
      })

      request["Authorization"] = "Bearer #{@access_token}"
      response = https.request(request)
      
      if response.code == '401' && @access_token_exp.past?
        get_access_token(:create, order_id,capture_id,tracking_number,carrier)
      elsif response.code == '200' || response.code == '201'
        true
        add_Paypal_log(response.code, "Paypal Tracking number addedd successfully",order_id)
      else
        log_error_and_notify_admin( response, "Error: Paypal Tracking number not addedd successfully",order_id)
      end
    end
  end
end

# touched on 2025-07-09T17:29:05.939870Z
# touched on 2025-07-09T17:29:24.810210Z
# touched on 2025-07-09T18:20:44.288286Z