module Spree
  class Admin::ChangeLogsController < Spree::Admin::BaseController

    def index
      @change_logs = Spree::ChangeLog.all.order(id: :desc).page(params.dig(:page) || 1 ).per(30)
    end

  end
end

# touched on 2025-07-09T18:17:41.727248Z