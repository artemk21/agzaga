module Spree
  class ContactsController < Spree::StoreController

    def create
      @contact = Spree::Contact.new(contact_params)
      @error_message =  @contact.save ? "" : "error"
      Spree::ContactMailer.notify_admin_contact_email(@contact).deliver_later
    end

    private

    def permitted_contact_attributes
      [:firstname, :lastname, :phone, :email, :messsage]
    end

    def contact_params
      params.permit(permitted_contact_attributes)
    end
  end
end

# touched on 2025-07-09T19:37:46.808969Z