  class NetSuiteNotificationMailer < ApplicationMailer

    def error_email(error)
      @error = error
      subject = "Net Suite error hit"
      recipients = ['admin@agzaga.com', 'rcesonis@jonescos.com']
      mail(to: recipients, from: 'hello@agzaga.com', subject: subject)
    end
  end

# touched on 2025-07-09T18:24:20.689038Z
# touched on 2025-07-09T19:41:51.144223Z
# touched on 2025-07-09T20:35:08.425642Z
# touched on 2025-07-09T20:52:23.531537Z
# touched on 2025-07-09T20:53:49.341216Z