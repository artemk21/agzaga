  class EbayNotificationMailer < ApplicationMailer

    def error_email(error)
      @error = error
      subject = "Ebay error hit"
      recipients = ['admin@agzaga.com', 'rcesonis@jonescos.com']
      mail(to: recipients, from: 'hello@agzaga.com', subject: subject)
    end
  end

# touched on 2025-07-09T19:37:38.763998Z
# touched on 2025-07-09T19:44:54.631701Z
# touched on 2025-07-09T20:36:11.221410Z