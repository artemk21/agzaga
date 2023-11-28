class CreateProductsCard < ApplicationJob
  queue_as :default

  def perform
    Spree::Product.all.each do |product|
      product.create_or_update_product_card
    end
  end
end

# touched on 2025-07-09T18:17:52.808857Z
# touched on 2025-07-09T18:19:28.345687Z
# touched on 2025-07-09T19:46:16.313508Z
# touched on 2025-07-09T20:35:14.089666Z
# touched on 2025-07-09T20:53:10.008221Z