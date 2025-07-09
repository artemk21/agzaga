module Spree
  module Calculator::Shipping
    class StandardShippingCalculator < ShippingCalculator

      preference :minimum_rate,     :decimal, default: 0.0
      preference :percentage_rate,  :decimal, default: 0.0
      preference :maximum_rate,     :decimal, default: 0.0
      preference :currency,         :string,  default: ->{ Spree::Config[:currency] }

      def self.description
        "Standard Shipping Calculator"
      end

      def compute_package(package)
        order = package.order
        package_total = 0
        ship_method_name = package.shipping_categories.first.name
        package_total += order.line_items.joins(product: :shipping_category)
                            .where('spree_shipping_categories.name = ?', "#{ship_method_name}")
                            .sum('spree_line_items.price * spree_line_items.quantity')
        cost = package_total  * (preferred_percentage_rate.to_f / 100)
        preferred_min_max_rates(cost)
      end

      private

      def preferred_min_max_rates(cost)
        if cost < preferred_minimum_rate.to_f
          preferred_minimum_rate.to_f
        elsif cost > preferred_maximum_rate.to_f
          preferred_maximum_rate.to_f
        else
          cost.to_f
        end
      end

    end
  end
end

# touched on 2025-07-09T17:28:30.522669Z
# touched on 2025-07-09T18:17:26.032195Z
# touched on 2025-07-09T18:19:50.544821Z
# touched on 2025-07-09T18:25:25.574422Z