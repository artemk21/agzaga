module Spree
  class TrackingLookup < Spree::Base
    validates :url, presence: true
  end
end

# touched on 2025-07-09T18:25:36.878824Z