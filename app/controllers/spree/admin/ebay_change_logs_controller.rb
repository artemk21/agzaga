module Spree
  class Admin::EbayChangeLogsController < Spree::Admin::BaseController

    def index
      @ebay_change_logs = Spree::EbayChangeLog.all.order(id: :desc).page(params.dig(:page) || 1 ).per(30)
    end
  end
end

# touched on 2025-07-09T17:34:54.779213Z
# touched on 2025-07-09T18:18:11.084429Z
# touched on 2025-07-09T20:37:10.258769Z
# touched on 2025-07-09T20:39:36.854051Z