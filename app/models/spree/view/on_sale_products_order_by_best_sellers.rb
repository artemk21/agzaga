module Spree::View
  class OnSaleProductsOrderByBestSellers < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:41:29.837610Z
# touched on 2025-07-09T18:25:42.207887Z
# touched on 2025-07-09T19:39:32.506031Z
# touched on 2025-07-09T20:32:29.724922Z