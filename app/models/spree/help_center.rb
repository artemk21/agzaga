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
# touched on 2025-07-09T19:40:39.747024Z
# touched on 2025-07-09T20:32:07.265156Z
# touched on 2025-07-09T20:37:25.018442Z
# touched on 2025-07-09T21:00:16.355436Z