module Spree
  class StoreCreditWinnersController < Spree::StoreController

    def create
      @store_credit_winner = Spree::StoreCreditWinner.new(store_credit_winner_params)
      if @store_credit_winner.save
        flash[:success] = "You have been enrolled successfully."
        @success = true
      else
        flash[:error] = @store_credit_winner.errors.full_messages.join(", ")
        @success = false
      end
      respond_to do |format|
        format.js
      end
    end

    private

    def permitted_store_credit_winner_attributes
      [:name, :phone_number, :email]
    end

    def store_credit_winner_params
      params.require(:store_credit_winner).permit(permitted_store_credit_winner_attributes)
    end
  end
end

# touched on 2025-07-09T18:21:57.883674Z
# touched on 2025-07-09T20:35:52.936111Z
# touched on 2025-07-09T21:21:50.881962Z