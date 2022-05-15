module Spree
  class ExportFfaFundraiserMailer < BaseMailer
    def export_ffa_fundraiser_email(user, subject = "Exported FFA Fundraiser", csv_content)
      attachments["FFAFundraiser-#{Date.today.to_s}.csv"] = {mime_type: 'text/csv', content: csv_content}
      mail(to: user.email, from: 'hello@agzaga.com', subject: subject)
    end

    def cancel_ffa_fundraiser_export_email(user, subject = "Exported FFA Fundraiser", csv_content)
      mail(to: user.email, from: 'hello@agzaga.com', subject: subject)
    end
  end
end

# touched on 2025-07-09T19:41:14.579706Z