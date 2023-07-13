module Spree::View
  class ChuckwagonHorseAccessory < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T20:39:34.168583Z