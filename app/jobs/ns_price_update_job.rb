class NsPriceUpdateJob < ApplicationJob
  queue_as :default

  def perform(products_data)
    products_list = JSON.parse products_data

    products_list.each do | product |
      sku = product["sku"]&.include?(":") ? product["sku"].split(":").last.strip : product["sku"]
      variant = Spree::Variant.find_by_sku(sku)
      if variant
        price = variant.prices.order('updated_at ASC').last
        price = variant.sale_prices.active.order('updated_at ASC').last.price if variant.sale_prices.active.present?
        previous_price = price.read_attribute(:amount)
        price.update_attribute(:amount, product["price"])
        new_price = price.read_attribute(:amount)
        change_log = {old_value: previous_price, new_value: new_price, field_name: "price"}
        variant.change_logs.create(change_log)
      end
    end

    response = {price_update_data: true, total_product_received: products_list.count}.to_json
    NsResponse.create(response: response)

  end

end

# touched on 2025-07-09T17:40:24.571558Z
# touched on 2025-07-09T17:43:12.623460Z
# touched on 2025-07-09T19:40:15.962448Z
# touched on 2025-07-09T19:40:31.405929Z