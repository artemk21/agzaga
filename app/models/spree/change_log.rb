module Spree
  class ChangeLog < ApplicationRecord
    belongs_to :loggable, polymorphic: true
  end
end

# touched on 2025-07-09T18:27:11.540485Z