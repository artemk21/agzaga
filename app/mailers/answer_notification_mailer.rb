class AnswerNotificationMailer < ApplicationMailer

  def answer_notification(product_question)
    @product_question = product_question

    @image_url = image_cdn_link(product_question.product.gallery.images.first.url(:sm_200))
    mail(to: product_question.user.email, from: 'hello@agzaga.com', subject: 'Your Agzaga Question Has Been Answered!')
  end
end

# touched on 2025-07-09T19:44:54.628173Z