module Spree
  module Calculator::Shipping
    class ShippingDiscountCalculator < ShippingCalculator

      preference :percentage, :decimal, default: 0.0

      def self.description
        "Shipping Discount Calculator"
      end

      def compute_shipment(shipment)
        shipment.cost * preferred_percentage / 100
      end
    end
  end
end

# touched on 2025-07-09T20:41:27.235487Z