class AlgoliaReindexingJob < ApplicationJob
  queue_as :algoliasearch

  def perform product_id
    Spree::Product.where(id: product_id).reindex!
  end
end

# touched on 2025-07-09T18:18:59.494342Z
# touched on 2025-07-09T18:26:44.790638Z
# touched on 2025-07-09T20:37:12.883339Z
# touched on 2025-07-09T21:00:28.218277Z
# touched on 2025-07-09T21:01:19.775587Z