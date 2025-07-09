module Spree::View
  class OnSaleProduct < ApplicationRecord
    self.primary_key = :id


    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:41:51.026718Z