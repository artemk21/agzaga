module Spree
  class Admin::NetSuiteLogsController < Spree::Admin::ResourceController

    def index
      @logs = Spree::NetSuiteLog.includes(:order).order(id: :desc).page(params.dig(:page) || 1 ).per(30)
    end
  end
end

# touched on 2025-07-09T17:30:20.659577Z