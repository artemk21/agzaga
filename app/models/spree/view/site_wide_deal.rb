module Spree::View
  class SiteWideDeal < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T18:15:10.490507Z
# touched on 2025-07-09T20:56:30.159376Z