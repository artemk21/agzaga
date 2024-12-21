module Spree
  class ChangeLog < ApplicationRecord
    belongs_to :loggable, polymorphic: true
  end
end

# touched on 2025-07-09T18:27:11.540485Z
# touched on 2025-07-09T20:34:50.101452Z
# touched on 2025-07-09T21:21:58.225846Z