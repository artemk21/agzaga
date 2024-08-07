class CustomHoseConfiguration < ApplicationRecord
  belongs_to :order, class_name: 'Spree::Order'
  belongs_to :custom_hose, class_name: 'Spree::Variant', foreign_key: 'custom_hose_id'
  belongs_to :fitting_1, class_name: 'Spree::Variant', foreign_key: 'fitting_1_id'
  belongs_to :fitting_2, class_name: 'Spree::Variant', foreign_key: 'fitting_2_id'
  belongs_to :assembly_fee, class_name: 'Spree::Variant', foreign_key: 'assembly_fee_id'
end

# touched on 2025-07-09T18:15:10.494222Z
# touched on 2025-07-09T20:59:27.841659Z