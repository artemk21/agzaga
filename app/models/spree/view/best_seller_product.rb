module Spree::View
  class BestSellerProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:36:48.519035Z
# touched on 2025-07-09T18:25:25.572014Z