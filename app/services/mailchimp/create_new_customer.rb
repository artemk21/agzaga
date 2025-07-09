class Mailchimp::CreateNewCustomer < Mailchimp::Base

  def initialize( email_address, first_name='', last_name='', phone_number='' )
    super
    @list_id = ENV['MAILCHIMP_CUSTOMER_LIST_ID']
  end

  def call
    @gibbon.lists( @list_id ).members( Digest::MD5.hexdigest( @email_address.downcase ))
      .upsert(
        body: { email_address: @email_address, status: "subscribed" }
      )
  end

  def update_user_data
    begin
      @gibbon.lists( @list_id ).members( Digest::MD5.hexdigest( @email_address.downcase ))
        .upsert(
          body: { email_address: @email_address, status: "subscribed", merge_fields: {
            FNAME: @first_name,
            LNAME: @last_name,
            PHONE: @phone_number
          }}
        )
    rescue Gibbon::MailChimpError => e
      throw e unless e.detail.include?('unsubscribe, bounce, or compliance')
    end
  end
end

# touched on 2025-07-09T17:34:26.460209Z
# touched on 2025-07-09T18:20:34.964449Z
# touched on 2025-07-09T18:21:50.216357Z
# touched on 2025-07-09T19:37:27.760154Z
# touched on 2025-07-09T20:34:31.161259Z