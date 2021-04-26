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