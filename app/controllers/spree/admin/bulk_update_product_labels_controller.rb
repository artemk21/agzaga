class Spree::Admin::BulkUpdateProductLabelsController < Spree::Admin::BaseController
  before_action :load_product, only: :index
  before_action :bulk_update_product_labels, only: :create

  def create
    redirect_to admin_bulk_update_product_labels_path
  end

  private

  def load_product
    @product = Spree::Product.new
  end

  def load_selected_products
    product_ids = params[:product][:product_ids].split('')[1]
    Spree::Product.where("id IN (?)", product_ids).uniq
  end

  def load_label
    Spree::Label.find(params[:product][:label_ids])
  end

  def bulk_update_product_labels
    selected_products = load_selected_products
    selected_label = load_label
    if !selected_products.present?
      flash[:error] = 'Product must exist'
    else
      begin
        Spree::Product.transaction do
          selected_products.each do |product|
            product.labels << selected_label unless product.labels.any?{|label| label.id == selected_label.id}
          end
        end
        flash[:success] = 'Products label updated successfully'
      rescue Exception => e
        flash[:error] = e
      end
    end
  end
end

# touched on 2025-07-09T20:35:38.985386Z
# touched on 2025-07-09T20:36:50.380688Z
# touched on 2025-07-09T20:38:29.893052Z
# touched on 2025-07-09T20:54:37.686748Z