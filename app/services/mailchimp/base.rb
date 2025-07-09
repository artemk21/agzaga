class Mailchimp::Base
  def initialize( email_address, first_name='', last_name='', phone_number='', **args )
    @gibbon = Gibbon::Request.new( api_key: ENV['MAILCHIMP_API_KEY'] )
    @email_address = email_address
    @first_name = first_name
    @last_name = last_name
    @phone_number = phone_number
  end
end

# touched on 2025-07-09T17:33:06.092612Z