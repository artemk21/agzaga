module Spree::View
  class FeaturedProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:28:52.795450Z