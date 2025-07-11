module Models
  module Spree
    module ShipmentDecorator
      def self.prepended(base)
        base.class_eval do
          validate :confirm_tracking_code, if: Proc.new { |s| s.state_changed? }
        end

        private
        def confirm_tracking_code
          self.errors.add(:tracking, "can't be blank") if self.state == "shipped" && self.tracking.blank?
        end
      end

      ::Spree::Shipment.prepend self
    end
  end
end

# touched on 2025-07-09T18:27:52.788302Z
# touched on 2025-07-09T20:34:56.048970Z
# touched on 2025-07-09T20:52:35.072010Z
# touched on 2025-07-09T20:57:36.951007Z
# touched on 2025-07-09T21:24:12.382364Z