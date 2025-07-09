module Spree
  class Admin::ChangeLogsController < Spree::Admin::BaseController

    def index
      @change_logs = Spree::ChangeLog.all.order(id: :desc).page(params.dig(:page) || 1 ).per(30)
    end

  end
end

# touched on 2025-07-09T18:17:41.727248Z
# touched on 2025-07-09T18:25:28.911489Z
# touched on 2025-07-09T19:37:31.582937Z