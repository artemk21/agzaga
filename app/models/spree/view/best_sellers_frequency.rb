module Spree::View
  class BestSellersFrequency < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T18:15:21.323273Z
# touched on 2025-07-09T18:19:40.797512Z