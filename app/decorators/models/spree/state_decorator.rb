module Models
  module Spree
    module StateDecorator
      def self.prepended(base)
        base.class_eval do
          scope :allowed_US_states, -> { where.not(name: ["Alaska", "Hawaii", "American Samoa", "Armed Forces Africa, Canada, Europe, Middle East", "Armed Forces Americas (except Canada)", "Armed Forces Pacific", "Guam", "Northern Mariana Islands", "Puerto Rico", "United States Minor Outlying Islands", "Virgin Islands"])  }
        end
      end

      ::Spree::State.prepend self
    end
  end
end

# touched on 2025-07-09T17:34:05.270266Z
# touched on 2025-07-09T17:34:59.775756Z