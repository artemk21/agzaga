module Spree::View
  class FfaProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T19:43:05.311519Z