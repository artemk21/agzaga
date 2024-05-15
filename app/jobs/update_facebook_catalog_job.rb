class UpdateFacebookCatalogJob < ApplicationJob
  queue_as :default

  def perform
    FacebookBatchApi::CatalogService.new().update_facebook_product_ids
    FacebookBatchApi::CatalogService.new().batch_request
  end
end

# touched on 2025-07-09T17:28:36.662809Z
# touched on 2025-07-09T19:43:23.350612Z
# touched on 2025-07-09T20:35:38.986290Z
# touched on 2025-07-09T20:54:12.490109Z
# touched on 2025-07-09T20:56:14.710736Z
# touched on 2025-07-09T20:57:31.015661Z