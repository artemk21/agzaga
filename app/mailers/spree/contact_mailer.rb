module Spree
  class ContactMailer < BaseMailer

    def notify_admin_contact_email(contact, admin_email = 'support@agzaga.com')
      @contact = contact
      subject = "#{@contact.email} sent a new message"
      mail(to: admin_email, from: contact.email, subject: subject)
    end

  end
end

# touched on 2025-07-09T18:17:44.835607Z