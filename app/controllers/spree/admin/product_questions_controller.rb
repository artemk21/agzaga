class Spree::Admin::ProductQuestionsController < Spree::Admin::ResourceController

  def index
    @product_questions  = collection
  end

  def publish
    product_question = Spree::ProductQuestion.find(params[:id])

    if product_question.update_attribute(:visibility, true)
      flash[:success] = "Answer Published"
    else
      flash[:error] = "Error occurred while Publishing answer"
    end

    redirect_to admin_product_questions_path
  end

  def edit
    if @product_question.product.nil?
      flash[:error] = I18n.t('spree.error_no_product')
      redirect_to admin_product_questions_path
    end
  end

  private

  def collection
    params[:q] ||= {}

    @search = Spree::ProductQuestion.most_recent_first.ransack(params[:q])
    @collection = @search.result.includes([:product, :user]).page(params[:page]).per(params[:per_page])
  end
end

# touched on 2025-07-09T17:36:33.048948Z
# touched on 2025-07-09T19:44:14.949231Z
# touched on 2025-07-09T20:34:56.050868Z