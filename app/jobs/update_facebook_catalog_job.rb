class UpdateFacebookCatalogJob < ApplicationJob
  queue_as :default

  def perform
    FacebookBatchApi::CatalogService.new().update_facebook_product_ids
    FacebookBatchApi::CatalogService.new().batch_request
  end
end

# touched on 2025-07-09T17:28:36.662809Z