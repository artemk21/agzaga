class Spree::Admin::FeaturedProductsController < Spree::Admin::BaseController
  helper Spree::BaseHelper

  def index
    @featured_products  = collection.order('spree_products.position asc')
  end

  def update_positions
    ActiveRecord::Base.transaction do
      positions = params[:positions]
      records = Spree::Product.where(id: positions.keys).to_a

      positions.each do |id, index|
        records.find { |r| r.id == id.to_i }&.update!(position: index)
      end
    end

    respond_to do |format|
      format.js { head :no_content }
    end
  end

  private

  def collection
    params[:q] ||= {}

    @search = Spree::Product.featured_products.ransack(params[:q])
    @collection = @search.result.page(params[:page]).per(params[:per_page])
  end
end

# touched on 2025-07-09T18:28:15.204165Z
# touched on 2025-07-09T19:38:48.197508Z