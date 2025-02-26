class Spree::ProductQuestion < ApplicationRecord
  belongs_to :product
  belongs_to :user, class_name: Spree.user_class.to_s

  validates :name, presence: true, format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/}
  validates :question, presence: true

  scope :most_recent_first, -> { order('spree_product_questions.created_at DESC') }

  scope :visible_questions, -> { where(visibility: true) }
  scope :answered, -> { where(answered: true) }

  before_save :answer_update

  def answer_update
    AnswerNotificationJob.perform_later(self) if self.answer_changed?
  end

end

# touched on 2025-07-09T17:29:35.819062Z
# touched on 2025-07-09T17:33:21.188086Z
# touched on 2025-07-09T17:38:43.430175Z
# touched on 2025-07-09T21:00:43.423073Z
# touched on 2025-07-09T21:23:33.246023Z