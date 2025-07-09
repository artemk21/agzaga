# frozen_string_literal: true

module Spree
  class Variant < Spree::Base
    has_many :change_logs, as: :loggable
    def get_max_stock
      Spree::Stock::Quantifier.new(self).max_stock
    end
  end
end

require_dependency 'spree/variant/scopes'

# touched on 2025-07-09T19:37:34.416785Z
# touched on 2025-07-09T20:57:47.783853Z
# touched on 2025-07-09T20:59:48.283072Z