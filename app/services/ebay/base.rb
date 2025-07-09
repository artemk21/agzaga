class Ebay::Base

  FULFILMENT_SCOPE = 'https%3A%2F%2Fapi.ebay.com%2Foauth%2Fapi_scope%2Fsell.fulfillment.readonly'
  END_POINT = 'https://api.ebay.com/identity/v1/oauth2/token'

  def initialize
    @app_id =  ENV['EBAY_APP_ID']
    @cert_id = ENV['EBAY_CERT_ID']
    credentials       = Ebay::Credentials.last
    @refresh_token    = credentials.refresh_token
    @access_token     = credentials.access_token
    @access_token_exp = credentials.access_token_expiry
  end

  def mint_access_token(callback_name, *args)
    url = URI(END_POINT)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request['Authorization'] = "Basic #{Base64.strict_encode64("#{@app_id}:#{@cert_id}")}"
    request['Content-Type'] = 'application/x-www-form-urlencoded'
    request.body = "grant_type=refresh_token&refresh_token=#{CGI.escape(@refresh_token)}&scope=#{FULFILMENT_SCOPE}"

    response = https.request(request)

    if response.code == '200'
      data = JSON.parse(response.read_body)
      @access_token = data['access_token']
      @access_token_exp = data['expires_in'].to_i.seconds.after

      Ebay::Credentials.last.update(access_token: @access_token, access_token_expiry: @access_token_exp)

      add_Ebay_log(response.code, 'Access token refreshed successfully', args[0])
      send(callback_name, *(args))
    else
      log_error_and_notify_admin(response, 'Cannot refresh token', args[0])
    end
  end

  private

  def log_error_and_notify_admin(response, message = '', order_id = nil)
    log = Spree::EbayLog.new

    data = JSON.parse(response.read_body)
    error_text = data['error'].present? ? data['error'].humanize : ''

    log.response = "#{message}#{'.' if message.present?} #{error_text}"

    log.status_code = response&.code
    log.order_id =  order_id if order_id.present?
    log.save

    EbayNotificationMailer.error_email(log.response).deliver
  end

  def add_Ebay_log(status_code, message, order_id = nil)
    log = Spree::EbayLog.new
    log.status_code = status_code
    log.response    = message
    log.order_id    = order_id if order_id.present?
    log.save
  end

  def add_item_update_log(sku, new_quantity, old_quantity)
    log = Spree::EbayChangeLog.new
    log.sku = sku
    log.new_value = new_quantity
    log.old_value = old_quantity
    log.field_name = 'count_on_hand'
    log.save
  end
end

# touched on 2025-07-09T21:22:28.641416Z