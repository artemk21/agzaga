class GoogleIndexingJob < ApplicationJob
  queue_as :default

  def perform product_slug, url_type
    Google::GoogleIndexingService.new.update_url_notification("https://agzaga.com/products/#{product_slug}", url_type)
  end
end

# touched on 2025-07-09T17:43:58.831973Z
# touched on 2025-07-09T19:38:59.761153Z