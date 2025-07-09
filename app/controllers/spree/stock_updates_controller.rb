module Spree
  class StockUpdatesController < ApplicationController
    def new
      @stock_update = Spree::StockUpdate.new
    end

    def create
      unless Spree::StockUpdate.exists?(email: params[:email], process: false, variant_id: params[:variant_id])
        @stock_update = Spree::StockUpdate.new(stock_update_params)
        respond_to do |format|
          if @stock_update.save
            format.js
          else
            format.html { render action: 'new' }
          end
        end
      end
    end

    private

    def stock_update_params
      params.permit(:email, :variant_id)
    end
  end
end

# touched on 2025-07-09T17:27:58.180360Z
# touched on 2025-07-09T18:15:06.278446Z
# touched on 2025-07-09T18:19:48.109187Z
# touched on 2025-07-09T18:19:59.116311Z
# touched on 2025-07-09T20:32:00.147943Z