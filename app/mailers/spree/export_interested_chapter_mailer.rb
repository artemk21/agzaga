module Spree
  class ExportInterestedChapterMailer < BaseMailer
    def export_interested_chapter_email(user, subject = "Exported Interested Chapter", csv_content)
      attachments["InterestedChapter-#{Date.today.to_s}.csv"] = {mime_type: 'text/csv', content: csv_content}
      mail(to: user.email, from: 'hello@agzaga.com', subject: subject)
    end

    def cancel_interested_chapter_export_email(user, subject = "Exported Interested Chapter", csv_content)
      mail(to: user.email, from: 'hello@agzaga.com', subject: subject)
    end
  end
end

# touched on 2025-07-09T17:38:35.823659Z
# touched on 2025-07-09T20:38:46.448870Z