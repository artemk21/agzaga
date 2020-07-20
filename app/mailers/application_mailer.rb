class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  include ApplicationHelper
  helper :application

end

# touched on 2025-07-09T17:37:45.774021Z