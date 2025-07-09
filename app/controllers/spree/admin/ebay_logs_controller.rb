module Spree
  class Admin::EbayLogsController < Spree::Admin::ResourceController

    def index
      @logs = Spree::EbayLog.order(id: :desc).page(params.dig(:page) || 1 ).per(30)
    end
  end
end

# touched on 2025-07-09T17:33:00.607215Z