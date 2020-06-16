module Spree

  class SaveItem < ApplicationRecord
    belongs_to :user, class_name: 'Spree::User'
    belongs_to :variant, class_name: 'Spree::Variant'
  end
end

# touched on 2025-07-09T17:35:47.572713Z