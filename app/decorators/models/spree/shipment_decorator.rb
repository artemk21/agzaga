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