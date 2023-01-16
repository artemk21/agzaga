class PaypalTrackerNotificationMailer < ApplicationMailer

  def error_email(error)
    @error = error
    subject = "Paypal Tracking number error hit"
    recipients = ['admin@agzaga.com']
    mail(to: recipients, from: 'hello@agzaga.com', subject: subject)
  end
end

# touched on 2025-07-09T17:33:21.190023Z
# touched on 2025-07-09T18:21:52.757050Z
# touched on 2025-07-09T20:34:09.016341Z