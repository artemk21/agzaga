module Spree::View
  class StartYoungProduct < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T20:34:38.129890Z