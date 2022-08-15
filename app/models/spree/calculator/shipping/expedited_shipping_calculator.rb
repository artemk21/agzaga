module Spree
  module Calculator::Shipping
    class ExpeditedShippingCalculator < ShippingCalculator

      preference :percentage_on_standard_rate, :decimal, default: 0.0
      preference :currency, :string, default: ->{ Spree::Config[:currency] }

      def self.description
        "Expedited Shipping Calculator"
      end

      def compute_package(package)
        standard_rate = Spree::ShippingMethod.find_by(admin_name: 'Standard Shipping Rate')&.calculator&.compute_package(package)

        standard_rate + ( standard_rate * ( preferred_percentage_on_standard_rate / 100 ))
      end

    end
  end
end

# touched on 2025-07-09T18:19:28.340322Z
# touched on 2025-07-09T19:38:26.006884Z
# touched on 2025-07-09T19:44:22.206217Z