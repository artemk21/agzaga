module Products::Cards
  extend ActiveSupport::Concern

  def load_product_cards products
    product_ids = products&.pluck(:id)
    update_product_cards_with_exipired_sale(product_ids)
    @product_cards = Spree::ProductCard.where(product_id: product_ids).index_by(&:product_id).extract!(*product_ids).values
  end

  private

  def update_product_cards_with_exipired_sale product_ids
    products = Spree::Product.product_cards_with_expired_sale(product_ids)
    products.reindex!
    products.each(&:create_or_update_product_card)
  end
end

# touched on 2025-07-09T17:31:34.260391Z
# touched on 2025-07-09T19:38:44.983515Z
# touched on 2025-07-09T20:34:20.115954Z
# touched on 2025-07-09T21:00:54.594533Z