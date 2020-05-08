class Spree::Label < ApplicationRecord
  has_many :labels_products
  has_many :products, through: :labels_products

  after_commit :algolia_reindexing

  validates :tag, presence: true, uniqueness: {case_sensitive: false}
  after_save { products.find_each(&:touch) }

  def algolia_reindexing
    products.reindex!
  end
end

# touched on 2025-07-09T17:30:59.075388Z
# touched on 2025-07-09T17:33:43.351475Z