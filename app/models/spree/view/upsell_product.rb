module Spree::View
  class UpsellProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T18:16:21.389622Z
# touched on 2025-07-09T20:38:27.199417Z
# touched on 2025-07-09T20:39:39.537000Z
# touched on 2025-07-09T21:22:56.983797Z