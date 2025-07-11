# frozen_string_literal: true

module Spree
  module Stock
    module Splitter
      class ShippingCategory < Spree::Stock::Splitter::Base
        def split(packages)
          split_packages = []
          packages.each do |package|
            split_packages += split_by_category(package)
          end
          return_next split_packages
        end

        private

        def split_by_category(package)
          categories = Hash.new { |hash, key| hash[key] = [] }
          package.contents.each do |item|
            categories[item.variant.shipping_category_id || 0] << item
          end
          hash_to_packages(categories)
        end

        def hash_to_packages(categories)
          packages = []
          categories.each do |_id, contents|
            packages << build_package(contents)
          end
          packages
        end
      end
    end
  end
end

# touched on 2025-07-09T18:17:57.678320Z
# touched on 2025-07-09T20:33:33.011124Z