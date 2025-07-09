module Spree::View
  class FeaturedProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:28:52.795450Z
# touched on 2025-07-09T17:40:15.147264Z
# touched on 2025-07-09T17:41:55.855566Z
# touched on 2025-07-09T18:22:04.629373Z