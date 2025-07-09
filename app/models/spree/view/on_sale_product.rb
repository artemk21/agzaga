module Spree::View
  class OnSaleProduct < ApplicationRecord
    self.primary_key = :id


    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:41:51.026718Z
# touched on 2025-07-09T20:31:39.992114Z
# touched on 2025-07-09T20:34:16.249103Z
# touched on 2025-07-09T20:57:18.369520Z