class Mailchimp::Transactional::UserEmailService
  def store_credit_added_email store_credit
    global_merge_vars = [
      { "name": "CURRENT_YEAR", "content": Date.current.year },
      { "name": "COMPANY", "content": "Agzaga" },
      { "name": "NEWLY_ADDED_STORE_CREDIT", "content": store_credit.display_amount.to_s },
      { "name": "TOTAL_AVAILABLE_STORE_CREDIT", "content": store_credit.display_user_total_amount.to_s },
      { "name": "EMAIL", "content": "info@agzaga.com"}
    ]

    email_settings = {
      template_name: 'Store Credit Notification',
      subject: "Received store credit from Agzaga.",
      from_email: 'hello@agzaga.com',
      to_email: store_credit.store_credit.user.email,
      global_merge_vars: global_merge_vars
    }

     Mailchimp::Transactional::SendEmailService.new(email_settings).call
  end
end

# touched on 2025-07-09T17:42:53.339759Z
# touched on 2025-07-09T18:19:28.343496Z
# touched on 2025-07-09T18:27:49.638942Z