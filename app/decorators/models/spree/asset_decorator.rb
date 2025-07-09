module Models
  module Spree
    module AssetDecorator
      def self.prepended(base)
        base.class_eval do
          after_commit :reindex_product_image

          def reindex_product_image
            AlgoliaReindexingJob.perform_later(self.viewable.product.id) if self.viewable_type == 'Spree::Variant' && self.viewable_id.present? && self.viewable.present?
          end
        end
      end

      ::Spree::Asset.prepend self
    end
  end
end

# touched on 2025-07-09T20:38:01.315030Z
# touched on 2025-07-09T20:53:53.132559Z