module FacebookBatchApi
  class CatalogService
    include GoogleProductCategoryHelper

    def initialize
      @access_token = ENV['FACEBOOK_ACCESS_TOKEN']
      @catalog_id = ENV['FACEBOOK_CATALOG_ID']
      @api_version = ENV['FACEBOOK_API_VERSION']
      @product_base_url = ENV['FB_PRODUCT_BASE_URL']
    end

    def batch_request
      availabile_products = Spree::Product.available.exclude_custom_products
      availabile_products.in_batches(of: 1000) do |availabile_products|
        bulk_update_products(availabile_products)
      end
    end

    def bulk_update_products availabile_products
      url = URI("https://graph.facebook.com/#{@api_version}/#{@catalog_id}/items_batch?access_token=#{@access_token}")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/json"
      request.body = JSON.dump(bulk_update_request_data(availabile_products))

      response = https.request(request)
      if response.code == '200'
        add_facebook_api_log(response.code, response.body)
      else
        response_message = JSON.parse(response.body)['error']['message']
        add_facebook_api_log(response.code, response_message)
      end
    end

    def get_facebook_products_catalog fields
      url = URI("https://graph.facebook.com/#{@api_version}/#{@catalog_id}/products?fields=#{fields}&limit=2000&access_token=#{@access_token}")

      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["Content-Type"] = "application/json"

      response = https.request(request)

      if response.code == '200'
        add_facebook_api_log(response.code, "FaceBook products catalog fetched successfully")
        return JSON.parse(response.read_body)
      else
        response_message = "FaceBook products catalog not fetched. " + JSON.parse(response.body)['error']['message']
        add_facebook_api_log(response.code, response_message)
      end
    end

    def update_facebook_product_ids
      products = Spree::Product.without_facebook_id
      return true if products.length == 0

      catalog = get_facebook_products_catalog('retailer_id,id')

      products.each do |product|
        product_retailer_id = product.sku.present? ? product.sku : product.slug
        fb_item = catalog['data'].select{|item| item["retailer_id"] == product_retailer_id}
        product.update_column(:facebook_id, fb_item[0]['id']) unless fb_item.blank?
      end

      add_facebook_api_log(200, "Added FaceBook product id to products.")
    end

    private

    def bulk_update_request_data availabile_products
      data = {
        "item_type": "PRODUCT_ITEM",
        "requests": availabile_products.map do |product|
          sku_data = product.sku.present? ? product.sku : product.slug

          product_description = product.description

          product_properties = product.product_properties.includes(:property)

          if product_description.present?
            description_data = Nokogiri::HTML(product_description).text
          elsif product_properties.present?
            description_data = product_properties&.where(visibility: true)&.map{|product_property| "#{product_property&.property&.presentation}: #{product_property&.value}"}&.join(', ')
          end

          product_brand = product&.property(:Brand)
          product_brand = "Agzaga" if product_brand.blank?

          catalog_product = {
                              method: "UPDATE",
                              data: {
                                id: sku_data,
                                title: product.name,
                                description: description_data,
                                availability: availability_for(product),
                                brand: product_brand,
                                condition: "new",
                                quantity_to_sell_on_facebook: product.master.total_on_hand
                              }
                            }

          if product.on_sale?
            catalog_product[:data][:price] = "#{product.original_price.to_f} USD"
            catalog_product[:data][:sale_price] = "#{product.price.to_f} USD"
          else
            catalog_product[:data][:price] = "#{product.price.to_f} USD"
            catalog_product[:data][:sale_price] = "0 USD"
          end

          catalog_product[:data][:google_product_category] = google_product_categories[product.google_product_category] if product&.google_product_category.present?

          catalog_product[:data][:image_link] = product&.gallery&.images&.map{|image| image.url(:product) }&.join(',')
          catalog_product[:data][:link] = @product_base_url + product.slug + '/' + product.facebook_id.to_s
          catalog_product
        end
      }

      data
    end

    def add_facebook_api_log status_code, message
      log = Spree::FacebookApiLog.create(status_code: status_code, response: message)
    end

    def availability_for product
      product_variants = product.variants
      (product_variants.present? && product_variants.any?{ |v| v.can_supply? }) || product.master.can_supply? ? 'in stock' : 'out of stock'
    end
  end
end

# touched on 2025-07-09T21:23:27.426768Z