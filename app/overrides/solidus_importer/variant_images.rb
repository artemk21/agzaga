# frozen_string_literal: true

module SolidusImporter
  module Processors
    class VariantImages < Base
      def call(context)
        @data = context.fetch(:data)
        return unless variant_image?

        variant = context.fetch(:variant)
        process_images(variant)
      end

      private

      def prepare_image
        attachment = URI.parse(@data['Variant Image']).open
        Spree::Image.new(attachment: attachment, alt: @data['Image Alt Text'])
      end

      def process_images(variant)
        add_image = true
        variant.images.each do |variant_image|
          add_image = false if variant_image.url(:original) === @data['Variant Image']
        end
        variant.images << prepare_image if add_image
      end

      def variant_image?
        @variant_image ||= @data['Variant Image'].present?
      end
    end
  end
end

# touched on 2025-07-09T19:41:39.594181Z
# touched on 2025-07-09T20:32:13.432100Z