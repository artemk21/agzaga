module Models
  module Spree
    module PriceDecorator
      def self.prepended(base)
        base.class_eval do
          after_commit :reindex_price

          def reindex_price
            AlgoliaReindexingJob.perform_later(self.product.id)
          end
        end
      end

      def update_calculated_sale_prices
        reload
        sale_prices.each(&:update_calculated_price!) if sale_prices.active.present?
      end

      ::Spree::Price.prepend self
    end
  end
end

# touched on 2025-07-09T17:43:49.986826Z