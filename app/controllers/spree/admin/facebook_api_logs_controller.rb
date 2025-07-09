class Spree::Admin::FacebookApiLogsController < Spree::Admin::BaseController

  def index
    @facebook_api_logs = Spree::FacebookApiLog.order(id: :desc).page(params.dig(:page) || 1 ).per(30)
  end

  def update_product_catalog
    if ENV.fetch('FACEBOOK_INTEGRATION') == 'Active'
      UpdateFacebookCatalogJob.perform_later()
      flash[:success] = "Catalog update job scheduled successfully, Facebook catalog will be updated soon"
    else
      flash[:error] = "Facebook integration is not active"
    end
    redirect_to admin_facebook_api_logs_path
  end
end

# touched on 2025-07-09T17:29:35.825029Z
# touched on 2025-07-09T17:41:36.111427Z