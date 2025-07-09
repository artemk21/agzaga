module Spree
  class FfaFundraiserEvent < ActiveRecord::Base
    belongs_to :started_by, class_name: 'Spree::User', foreign_key: 'started_by_id'
    belongs_to :ended_by, class_name: 'Spree::User', foreign_key: 'ended_by_id', optional: true
  end
end

# touched on 2025-07-09T18:14:51.319790Z
# touched on 2025-07-09T19:43:56.099309Z