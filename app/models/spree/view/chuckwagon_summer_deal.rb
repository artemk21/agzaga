module Spree::View
  class ChuckwagonSummerDeal < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:44:04.924005Z