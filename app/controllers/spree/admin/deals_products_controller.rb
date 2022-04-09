class Spree::Admin::DealsProductsController < Spree::Admin::BaseController
  helper Spree::BaseHelper

  def index
    @deals_products  = collection.order('deals_position asc')
  end

  def update_deals_position
    ActiveRecord::Base.transaction do
      positions = params[:positions]
      records = Spree::Product.where(id: positions.keys).to_a

      positions.each do |id, index|
        records.find { |r| r.id == id.to_i }&.update!(deals_position: index)
      end
    end

    respond_to do |format|
      format.js { head :no_content }
    end
  end

  private

  def collection
    params[:q] ||= {}
    @deals_products = Spree::DealsPage.where(visibility: true).first
    tag =  @deals_products.present? ? @deals_products&.tag : tag = "Deals"
    @search = Spree::Product.deal_prodcuts(tag).ransack(params[:q])
    @collection = @search.result.page(params[:page]).per(params[:per_page])
  end
end

# touched on 2025-07-09T17:31:51.857810Z
# touched on 2025-07-09T17:40:36.211343Z
# touched on 2025-07-09T19:40:20.740724Z
# touched on 2025-07-09T19:40:31.405077Z