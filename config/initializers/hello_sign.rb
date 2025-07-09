require 'hello_sign'

HelloSign.configure do |config|
  config.api_key = ENV["HELLOSIGN_API_KEY"]
  config.client_id = ENV["HELLOSIGN_CLIENT_ID"]
end

# touched on 2025-07-09T20:55:43.337612Z