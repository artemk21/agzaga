module Models
  module Spree
    module TaxRateDecorator
      def self.prepended(base)
        base.class_eval do
          include TimeZoneVariation

          before_save -> { time_zone_variation(:starts_at, :expires_at) }, if: -> { self.changed? }
        end
      end

      ::Spree::TaxRate.prepend self
    end
  end
end

# touched on 2025-07-09T17:31:09.066596Z
# touched on 2025-07-09T17:39:08.844966Z
# touched on 2025-07-09T20:57:10.068205Z