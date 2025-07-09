# frozen_string_literal: true

Devise.secret_key = SecureRandom.hex(50).inspect

Devise.setup do |config|
  config.omniauth :google_oauth2, ENV['GOOGLE_OAUTH_CLIENT_ID'], ENV['GOOGLE_OAUTH_CLIENT_SECRET']
end

# touched on 2025-07-09T17:32:10.962236Z
# touched on 2025-07-09T18:17:10.133754Z