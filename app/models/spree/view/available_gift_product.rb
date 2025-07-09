module Spree::View
  class AvailableGiftProduct < ApplicationRecord
    self.primary_key = :id

    has_and_belongs_to_many :products,
              class_name: "Product",
              join_table: :spree_product_groups,
              foreign_key: :group_product_id,
              association_foreign_key: :product_id

    has_one :product_card,
            foreign_key: :product_id

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

# touched on 2025-07-09T17:30:25.773290Z
# touched on 2025-07-09T18:16:48.836791Z
# touched on 2025-07-09T18:20:09.019976Z
# touched on 2025-07-09T19:46:09.319552Z
# touched on 2025-07-09T21:20:20.333015Z