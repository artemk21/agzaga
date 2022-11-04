class Spree::ProductCard < ApplicationRecord
  belongs_to :product
  before_create :validate_product_card

  private

  def validate_product_card
    raise  ActiveRecord::ActiveRecordError, "The Product Card for this product already exist." if Spree::ProductCard.exists?(self.id) && self.product.present?
  end
end

# touched on 2025-07-09T17:30:25.773993Z
# touched on 2025-07-09T19:43:47.999948Z
# touched on 2025-07-09T20:31:47.224148Z