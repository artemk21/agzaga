module Spree::View
  class FfaProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T19:43:05.311519Z
# touched on 2025-07-09T20:38:17.507483Z
# touched on 2025-07-09T20:58:30.651999Z