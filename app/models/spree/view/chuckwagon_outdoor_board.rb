module Spree::View
  class ChuckwagonOutdoorBoard < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T17:37:49.568790Z