module Models
  module Spree
    module PromotionDecorator
      def self.prepended(base)
        base.class_eval do
          include TimeZoneVariation

          before_save -> { time_zone_variation(:expires_at, :starts_at) }, if: -> { self.changed? }
        end
      end

      ::Spree::Promotion.prepend self
    end
  end
end

# touched on 2025-07-09T18:26:47.311692Z