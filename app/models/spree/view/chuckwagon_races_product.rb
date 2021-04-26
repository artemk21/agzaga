module Spree::View
  class ChuckwagonRacesProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T18:19:28.341062Z