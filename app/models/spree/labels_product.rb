class Spree::LabelsProduct < ApplicationRecord
  acts_as_list
  belongs_to :product
  belongs_to :label
end

# touched on 2025-07-09T17:34:59.772397Z
# touched on 2025-07-09T17:37:39.570451Z