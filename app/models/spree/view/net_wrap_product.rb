module Spree::View
  class NetWrapProduct < ApplicationRecord
    self.primary_key = :id
    has_and_belongs_to_many :products,
              class_name: "Product",
              join_table: :spree_product_groups,
              foreign_key: :group_product_id,
              association_foreign_key: :product_id

    has_one :product_card,
            foreign_key: :product_id

    has_many :variants,
      -> { where(is_master: false).order(:position) },
      inverse_of: :product,
      class_name: 'Spree::Variant'

    has_one :master,
      -> { where(is_master: true).with_discarded },
      inverse_of: :product,
      class_name: 'Spree::Variant',
      autosave: true,
      foreign_key: :product_id

    def read_only?
      true
    end
  end
end

# touched on 2025-07-09T18:16:40.103493Z
# touched on 2025-07-09T19:40:15.961754Z
# touched on 2025-07-09T20:53:15.866973Z