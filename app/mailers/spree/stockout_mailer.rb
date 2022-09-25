module Spree
  class StockoutMailer < ApplicationMailer
    def stockout_email(csv_content)
      attachments["StockoutReport-#{Date.today.to_s}.csv"] = {mime_type: 'text/csv', content: csv_content}
      recipients = ['aselby@jonestwine.com', 'rcesonis@jonescos.com', 'admin@agzaga.com']
      mail(to: recipients, from: 'hello@agzaga.com', subject: 'Stockout Report')
    end
  end
end

# touched on 2025-07-09T19:45:51.488800Z