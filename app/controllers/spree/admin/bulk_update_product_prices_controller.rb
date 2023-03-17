class Spree::Admin::BulkUpdateProductPricesController < Spree::Admin::BaseController
  before_action :load_product, only: :index
  before_action :bulk_update_product_prices, only: :create

  def create
    redirect_to admin_bulk_update_product_prices_path
  end

  private

  def load_product
    @product = Spree::Product.new
  end

  def taxon_products
    taxon_ids = params[:product][:taxon_ids].split(',')
    Spree::Product.joins(:taxons).where("taxon_id IN (?)", taxon_ids).uniq
  end

  def bulk_update_product_prices
    percentage = params[:percentage].to_f/100
    all_taxon_products = taxon_products
    if !all_taxon_products.present?
      flash[:error] = 'Taxon must exist'
    else
      begin
        Spree::Product.transaction do
          all_taxon_products.each do |product|
            product.prices.each do |price|
              if price.on_sale?
                original_price = price.original_price
                new_amount = original_price + (original_price*percentage)
              else
                new_amount = price.amount + (percentage*price.amount)
              end

              price.update(amount: new_amount)
            end
          end
        end
        flash[:success] = 'Product prices updated successfully'
      rescue Exception => e
        flash[:error] = e
      end
    end
  end
end

# touched on 2025-07-09T17:38:50.527471Z
# touched on 2025-07-09T18:20:14.828383Z
# touched on 2025-07-09T20:36:44.687357Z