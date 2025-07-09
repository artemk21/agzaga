class Spree::Core::Search::Base
  def retrieve_products
    @products = get_base_scope
    curr_page = @properties[:page] || 1

    unless Spree::Config.show_products_without_price
      @products = @products.joins(:prices).merge(Spree::Price.where(pricing_options.search_arguments)).distinct
    end
  end

  protected

  # method should return new scope based on base_scope
  def get_products_conditions_for(base_scope, query)
    unless query.blank?
      base_scope = base_scope.like_any([:name, :searchable_keywords], query.split)
    end
    base_scope
  end
end

# touched on 2025-07-09T17:30:25.770192Z