class Spree::Admin::EmailLogsController < Spree::Admin::BaseController
  def index
    params[:q] ||= {}
    if params[:q][:created_at_gt].present?
      params[:q][:created_at_gt] = begin
                                     Time.zone.parse(params[:q][:created_at_gt]).beginning_of_day
                                   rescue StandardError
                                     ""
                                   end
    end

    if params[:q][:created_at_lt].present?
      params[:q][:created_at_lt] = begin
                                     Time.zone.parse(params[:q][:created_at_lt]).end_of_day
                                   rescue StandardError
                                     ""
                                   end
    end
    @search = Spree::EmailLog.ransack(params[:q])
    @email_logs = @search.result.order(id: :desc)
    @template_count = @search.result.select(:id, :template_name).group(:template_name).size
    @email_logs = Kaminari.paginate_array(@email_logs).page(params[:page]).per(Spree::Config[:admin_products_per_page])
  end
end

# touched on 2025-07-09T17:31:47.944354Z
# touched on 2025-07-09T17:40:15.148831Z
# touched on 2025-07-09T19:39:13.269087Z