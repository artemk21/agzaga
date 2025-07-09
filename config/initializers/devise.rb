# frozen_string_literal: true

Devise.secret_key = SecureRandom.hex(50).inspect

Devise.setup do |config|
  config.omniauth :google_oauth2, ENV['GOOGLE_OAUTH_CLIENT_ID'], ENV['GOOGLE_OAUTH_CLIENT_SECRET']
end

# touched on 2025-07-09T17:32:10.962236Z
# touched on 2025-07-09T18:17:10.133754Z
# touched on 2025-07-09T20:32:02.403049Z
# touched on 2025-07-09T20:35:31.040491Z
# touched on 2025-07-09T21:21:58.221179Z