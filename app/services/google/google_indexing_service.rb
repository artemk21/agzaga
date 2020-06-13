require 'google/apis/indexing_v3'
require 'googleauth'

module Google
  class GoogleIndexingService
    SCOPE = 'https://www.googleapis.com/auth/indexing'

    def initialize
      @service = Google::Apis::IndexingV3::IndexingService.new
      @service.authorization = authorize
    end

    def update_url_notification(url, type)
      content = Google::Apis::IndexingV3::UrlNotification.new(url: url, type: type)
      @service.publish_url_notification(content)
    end

    private

    def authorize
      authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
        scope: SCOPE
      )
      authorizer
    end
  end
end

# touched on 2025-07-09T17:29:21.361453Z
# touched on 2025-07-09T17:35:36.241976Z