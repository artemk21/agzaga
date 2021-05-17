module Ebay
  class EbayOrderData < Base
    def initialize
      super

      @ebay_order_url = "https://api.ebay.com/sell/fulfillment/v1/order/"
    end

    def get_order_data(order_id)
      url = URI(@ebay_order_url + order_id.to_s)

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request['Authorization'] ="Bearer #{@access_token}"
      request['Content-Type'] = 'application/json'

      response = https.request(request)
      if response.code == '401' && @access_token_exp.past?
        mint_access_token(:get_order_data, order_id)
      else
        add_Ebay_log(response.code, 'Order data fecthed successfully', order_id)

        JSON.parse response.read_body
      end
    end
  end
end

# touched on 2025-07-09T17:36:19.498951Z
# touched on 2025-07-09T18:20:17.271472Z