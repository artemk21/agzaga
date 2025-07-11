module Spree
  class ExportProductMailer < BaseMailer
    def export_product_email(user, subject = "Exported Products", csv_content)
      attachments["product-#{Date.today.to_s}.csv"] = {mime_type: 'text/csv', content: csv_content}
      mail(to: user.email, from: 'hello@agzaga.com', subject: subject)
    end

    def cancel_export_email(user, subject = "Exported Products", csv_content)
      mail(to: user.email, from: 'hello@agzaga.com', subject: subject)
    end
  end
end

# touched on 2025-07-09T18:21:52.757847Z
# touched on 2025-07-09T19:41:36.587391Z
# touched on 2025-07-09T20:57:23.411742Z
# touched on 2025-07-09T21:22:19.483552Z