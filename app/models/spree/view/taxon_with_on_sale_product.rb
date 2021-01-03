module Spree::View
  class TaxonWithOnSaleProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T18:14:49.169129Z