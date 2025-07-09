module Spree
  class Admin::NsResponsesController < Spree::Admin::BaseController

    def index
      @responses = NsResponse.all.order(id: :desc).page(params.dig(:page) || 1 ).per(30)
    end

  end
end

# touched on 2025-07-09T18:27:32.356577Z
# touched on 2025-07-09T20:36:01.389489Z
# touched on 2025-07-09T20:36:04.012502Z