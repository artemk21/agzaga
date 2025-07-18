class Spree::Admin::FfaFundraiserEventsController < Spree::Admin::BaseController

  before_action :load_event, only: :update

  def index
    @events = Spree::FfaFundraiserEvent.order(id: :desc)
                                       .page(params.dig(:page) || 1).per(15)
  end

  def create
    if Spree::FfaFundraiserEvent.create(started_by_id: spree_current_user.id, is_active: true)
      flash[:success] = "Event started successfully"
    else
      flash[:error] = "Something went wrong"
    end

    redirect_to action: :index
  end

  def update
    if @event.update(ended_by_id: spree_current_user.id, is_active: false, ended_at: DateTime.now)
      flash[:success] = "Event ended successfully"
    else
      flash[:error] = "Something went wrong"
    end

    redirect_to action: :index
  end

  private

  def load_event
    @event = Spree::FfaFundraiserEvent.find(params[:id])
  end
end

# touched on 2025-07-09T17:32:16.139061Z
# touched on 2025-07-09T20:55:11.471849Z
# touched on 2025-07-09T20:58:05.959909Z
# touched on 2025-07-09T21:00:08.301787Z