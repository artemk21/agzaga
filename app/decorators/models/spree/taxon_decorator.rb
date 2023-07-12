module Models
  module Spree
    module TaxonDecorator
      def self.prepended(base)
        base.class_eval do
          include TimeZoneVariation

          before_save -> { time_zone_variation(:small_ads_end_at, :large_ads_end_at) }, if: -> { self.changed? }
        end
      end

      ::Spree::Taxon.prepend self
    end
  end
end

# touched on 2025-07-09T18:26:03.125076Z
# touched on 2025-07-09T20:39:30.490348Z