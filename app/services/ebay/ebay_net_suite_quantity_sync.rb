module Ebay
  class EbayNetSuiteQuantitySync < Base
    def initialize
      super

      @ebay_trading_url = "https://api.ebay.com/ws/api.dll"
    end

    def update_ebay_stock(itemid, sku, new_quantity, old_quantity)
      url = URI(@ebay_trading_url)

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["X-EBAY-API-CALL-NAME"] = "ReviseInventoryStatus"
      request["X-EBAY-API-IAF-TOKEN"] = @access_token
      request["X-EBAY-API-SITEID"] = "0"
      request["X-EBAY-API-COMPATIBILITY-LEVEL"] = "1204"
      request["Content-Type"] = "application/xml"
      request.body = "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ReviseInventoryStatusRequest xmlns=\"urn:ebay:apis:eBLBaseComponents\">  <InventoryStatus>\n    <ItemID>#{itemid}</ItemID>\n    <SKU>#{sku}</SKU>\n    <Quantity>#{new_quantity}</Quantity>\n  </InventoryStatus>\n  \n  </ReviseInventoryStatusRequest>\n"

      response = https.request(request)

      hash = Hash.from_xml(response.read_body)

      if hash["ReviseInventoryStatusResponse"]["Ack"].include?("Failure") && @access_token_exp.past?
        mint_access_token(:update_ebay_stock, payload)
      else
        add_item_update_log(sku, new_quantity, old_quantity)
      end
    end
  end
end

# touched on 2025-07-09T17:32:10.959285Z
# touched on 2025-07-09T18:16:08.048536Z
# touched on 2025-07-09T20:54:40.227876Z
# touched on 2025-07-09T20:57:59.095134Z