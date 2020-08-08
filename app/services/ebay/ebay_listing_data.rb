module Ebay
  class EbayListingData < Base
    def initialize
      super

      @ebay_trading_url = "https://api.ebay.com/ws/api.dll"
    end

    def get_listing_data
      url = URI(@ebay_trading_url)

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["X-EBAY-API-CALL-NAME"] = "GetMyeBaySelling"
      request["X-EBAY-API-IAF-TOKEN"] = @access_token
      request["X-EBAY-API-SITEID"] = "0"
      request["X-EBAY-API-COMPATIBILITY-LEVEL"] = "1204"
      request["Content-Type"] = "application/xml"
      request.body = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<GetMyeBaySellingRequest xmlns=\"urn:ebay:apis:eBLBaseComponents\">    \n  <ActiveList>\n  </ActiveList>\n</GetMyeBaySellingRequest>"

      response = https.request(request)

      hash = Hash.from_xml(response.read_body)

      if hash["GetMyeBaySellingResponse"]["Ack"].include?("Failure") && @access_token_exp.past?
        mint_access_token(:get_listing_data)
      else
        add_Ebay_log(response.code, 'Listing data fecthed successfully')

        parse_data(hash)
      end
    end

    def parse_data(list)
      items_list = list['GetMyeBaySellingResponse']['ActiveList']['ItemArray']['Item']

      items = items_list.map do |item|
        if item['SKU']
          { itemid: item['ItemID'], sku: item['SKU'], quantity: item['QuantityAvailable'].to_i}
        elsif item['Variations']
          { itemid: item['ItemID'], sku: item['Variations']['Variation']&.pluck('SKU'), quantity: item['QuantityAvailable'].to_i }
        end
      end
    end
  end
end

# touched on 2025-07-09T17:38:35.822993Z