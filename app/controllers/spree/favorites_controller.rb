module Spree
  class FavoritesController < Spree::StoreController
    helper Spree::ProductsHelper

    before_action :find_favorite, only: [:destroy]
    before_action :set_order, only: %i[create destroy]

    respond_to :html, :js
    include Products::Cards

    def index
      @favorites = try_spree_current_user.favorites.includes(favorable: :product_card).page(params[:page]).
        per(SolidusFavorites::Config.favorites_per_page) || [] if spree_user_signed_in?
      @products = Kaminari.paginate_array(Spree::Product.available.newest_products).page(params.dig(:page) || 1 ).per(16)
      load_product_cards(@products)
    end

    def create
      @favorite = try_spree_current_user.favorites.new(favorite_params)

      if @favorite.save
        flash.now[:success] = t('spree.successfully_added_favorite')
      else
        flash.now[:error] = @favorite.errors.full_messages.to_sentence
      end

      respond_to do |format|
        format.js
      end
    end

    def destroy
      if @favorite&.destroy
        flash.now[:success] = t('spree.favorite_successfully_removed')
      else
        flash.now[:error] = t('spree.favorite_unsuccessfully_removed')
      end

      respond_with do |format|
        format.js
        format.html do
          redirect_to favorites_path
        end
      end
    end

    private

    def find_favorite
      @favorite ||= try_spree_current_user.favorites.find(params[:id])
    end

    def favorite_params
      params.permit(:favorable_id, :favorable_type, :variant_id)
    end

    def model_class
      Spree::Favorite
    end

    def set_order
      @order = current_order
    end
  end
end

# touched on 2025-07-09T19:37:25.541169Z
# touched on 2025-07-09T19:40:31.405250Z
# touched on 2025-07-09T19:43:23.352962Z
# touched on 2025-07-09T20:54:01.576928Z
# touched on 2025-07-09T20:55:24.139693Z
# touched on 2025-07-09T21:01:40.041469Z