Spree::Event.subscribe 'order_finalized' do |event|
  order = event.payload[:order]
  Spree::OrderMailer.notify_admin_order_placed_email(order).deliver_later

  CreateNetSuiteSalesOrderJob.perform_later(order.id, order.number) if ENV.fetch('NS_INTEGRATION_STATE') == 'Active'

  UpdateMailchimpDataJob.perform_later(order.id) if Rails.env.production? && order.user.present?

  if order.user.present? && order.user.orders.count == 1
    email_settings = {
      template_name: 'Welcome - After First Order',
      subject: 'Welcome - After First Order',
      to_email: order.email,
    }

    Mailchimp::Transactional::SendEmailService.new(email_settings).call
  end
end

# touched on 2025-07-09T18:21:55.147121Z
# touched on 2025-07-09T18:26:41.940535Z
# touched on 2025-07-09T19:38:37.296623Z