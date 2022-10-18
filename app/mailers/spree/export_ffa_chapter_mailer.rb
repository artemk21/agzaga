module Spree
  class ExportFfaChapterMailer < BaseMailer
    def export_ffa_chapter_email(user, subject = "Exported FFA Chapter", csv_content)
      subject = "#{subject} from staging" if ENV['APPLICATION_ENV'] == 'staging'
      attachments["FfaChapter-#{Date.today.to_s}.csv"] = {mime_type: 'text/csv', content: csv_content}
      mail(to: user.email, from: 'hello@agzaga.com', subject: subject)
    end

    def cancel_ffa_chapter_export_email(user, subject = "Exported FFA Chapter", csv_content)
      subject = "#{subject} from staging" if ENV['APPLICATION_ENV'] == 'staging'
      mail(to: user.email, from: 'hello@agzaga.com', subject: subject)
    end
  end
end

# touched on 2025-07-09T17:33:36.581513Z
# touched on 2025-07-09T18:28:20.908647Z
# touched on 2025-07-09T19:39:10.785496Z
# touched on 2025-07-09T19:42:05.387266Z
# touched on 2025-07-09T20:31:35.029204Z