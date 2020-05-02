class Spree::DealsPage < ApplicationRecord
  has_many  :images, as: :viewable, dependent: :destroy, class_name: "Spree::Image"
  has_one   :image, as: :viewable, dependent: :destroy, class_name: "Spree::Image"
end


# touched on 2025-07-09T17:33:31.613965Z