module Spree
  class NetSuiteLog < ApplicationRecord
    belongs_to :order, optional: true
  end
end

# touched on 2025-07-09T20:57:56.121660Z
# touched on 2025-07-09T21:21:27.809619Z