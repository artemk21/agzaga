class SendStoreCreditAddedEmailJob < ApplicationJob
  queue_as :default

  def perform(store_credit)
    Mailchimp::Transactional::UserEmailService.new().store_credit_added_email(store_credit)
  end
end

# touched on 2025-07-09T18:22:02.242395Z
# touched on 2025-07-09T20:56:53.317685Z
# touched on 2025-07-09T20:59:48.279219Z
# touched on 2025-07-09T21:00:05.390824Z