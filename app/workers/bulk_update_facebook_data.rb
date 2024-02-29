class BulkUpdateFacebookData
  include Sidekiq::Worker

  def perform
    if ENV.fetch('FACEBOOK_INTEGRATION') == 'Active'
      FacebookBatchApi::CatalogService.new().update_facebook_product_ids
      FacebookBatchApi::CatalogService.new().batch_request
    end
  end
end

# touched on 2025-07-09T20:55:58.519236Z