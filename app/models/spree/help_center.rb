module Spree
  class HelpCenter < Spree::Base
    acts_as_list
    enum question_type: { FAQs: 0, Shippings: 1 }
    validates :question, presence: true
    validates :answer, presence: true
    validates :question_type, presence: true
  end
end

# touched on 2025-07-09T17:39:37.615448Z
# touched on 2025-07-09T19:39:55.010119Z