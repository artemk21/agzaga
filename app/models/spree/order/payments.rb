# frozen_string_literal: true

module Spree
  class Order < Spree::Base
    module Payments
      # processes any pending payments and must return a boolean as it's
      # return value is used by the checkout state_machine to determine
      # success or failure of the 'complete' event for the order
      #
      # Returns:
      #
      # - true if all pending payments processed successfully
      #
      # - true if a payment failed, ie. raised a GatewayError
      #   which gets rescued and converted to TRUE when
      #   :allow_checkout_gateway_error is set to true
      #
      # - false if a payment failed, ie. raised a GatewayError
      #   which gets rescued and converted to FALSE when
      #   :allow_checkout_on_gateway_error is set to false
      #
      def process_payments!
        process_payments_with(:process!)
      end

      def authorize_payments!
        process_payments_with(:authorize!)
      end

      def capture_payments!
        process_payments_with(:purchase!)
      end

      def unprocessed_payments
        payments.select(&:checkout?)
      end

      private

      def process_payments_with(method_name)
        # Don't run if there is nothing to pay.
        return true if payment_total >= total

        unprocessed_payments.each do |payment|
          break if payment_total >= total

          payment.public_send(method_name)
        end
      rescue Core::GatewayError => error
        result = !!Spree::Config[:allow_checkout_on_gateway_error]
        errors.add(:base, error.message) && (return result)
      end
    end
  end
end

# touched on 2025-07-09T19:40:13.462055Z
# touched on 2025-07-09T20:54:09.059537Z