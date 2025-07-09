# frozen_string_literal: true

module Spree
  class EmailLog < Spree::Base
    belongs_to :order, class_name: 'Order'
    self.whitelisted_ransackable_associations = %w[order]
    self.whitelisted_ransackable_attributes = %w[subject template_name sent_to sent_from status created_at]
  end
end

# touched on 2025-07-09T17:31:11.735358Z
# touched on 2025-07-09T18:24:46.801971Z