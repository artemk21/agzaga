class NsDropshipItemsSyncJob < ApplicationJob
  queue_as :default

  def perform(products_data)
    products_list = JSON.parse products_data

    products_list.each do | product |
      sku = product["values"]["itemid"]&.include?(":") ? product["values"]["itemid"].split(":").last.strip : product["values"]["itemid"]
      variant = Spree::Variant.find_by_sku(sku)
      if variant
        variant.is_dropship = true
        variant.save
      end
    end

    response = {dropship_data_updated: true, total_product_received: products_list.count}.to_json
    NsResponse.create(response: response)
  end
end

# touched on 2025-07-09T17:35:15.462312Z
# touched on 2025-07-09T18:27:32.354947Z
# touched on 2025-07-09T20:34:16.247892Z