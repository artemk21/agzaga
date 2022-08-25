class UpdateMailchimpDataJob < ApplicationJob
  queue_as :default

  def perform order_id
    order = Spree::Order.find(order_id)
    email = order.user.email
    user = order.bill_address
    Mailchimp::CreateNewCustomer.new(email, user.first_name, user.last_name, user.phone).update_user_data
  end
end

# touched on 2025-07-09T17:42:21.952676Z
# touched on 2025-07-09T19:39:08.294115Z
# touched on 2025-07-09T19:44:36.588112Z