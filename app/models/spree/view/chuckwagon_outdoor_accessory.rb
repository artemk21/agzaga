module Spree::View
  class ChuckwagonOutdoorAccessory < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T20:57:23.413170Z