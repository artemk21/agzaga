class AnswerNotificationJob < ApplicationJob
  queue_as :default

  def perform(product_question)
    AnswerNotificationMailer.answer_notification(product_question).deliver_later
  end
end

# touched on 2025-07-09T20:32:27.051885Z