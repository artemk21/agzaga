module Spree::View
  class ChuckwagonPreOrder < ApplicationRecord
    self.primary_key = :id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T18:17:13.783473Z
# touched on 2025-07-09T19:40:04.403236Z
# touched on 2025-07-09T20:56:12.009868Z