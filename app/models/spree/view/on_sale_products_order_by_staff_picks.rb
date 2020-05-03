module Spree::View
  class OnSaleProductsOrderByStaffPicks < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:33:36.582268Z