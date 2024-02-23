module Models
  module SolidusPaypalCommercePlatform
    module PaypalAddressDecorator
      def self.prepended(base)
        base.class_eval do
          def simulate_update(paypal_address)
            @order.update(ship_address: format_simulated_address(paypal_address))

            return unless @order.ship_address.valid?


            #@order.ensure_updated_shipments
            @order.email = "info@solidus.io" unless @order.email
            @order.contents.advance
          end
        end
      end

      ::SolidusPaypalCommercePlatform::PaypalAddress.prepend self
    end
  end
end

# touched on 2025-07-09T18:26:39.338872Z
# touched on 2025-07-09T20:55:49.456651Z