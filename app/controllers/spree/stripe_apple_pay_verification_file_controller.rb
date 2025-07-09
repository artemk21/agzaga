module Spree
  class StripeApplePayVerificationFileController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show
      file_location = "#{Rails.root}/public/apple-developer-merchantid-domain-association"
      send_file(file_location, filename: "apple-developer-merchantid-domain-association")
    end
  end
end

# touched on 2025-07-09T17:28:41.311589Z
# touched on 2025-07-09T18:17:52.806461Z
# touched on 2025-07-09T20:38:52.074353Z