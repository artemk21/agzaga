# frozen_string_literal: true

module Spree
  class TaxonOptionsController < Spree::StoreController
    before_action :load_options, only: :index

    def index
      respond_to do |format|
        format.js
      end
    end

    private

    def load_options
      @option_types = [] and return if params.dig(:ids).blank?

      if params.dig(:ids).include? 'all'
        products_ids = Product.joins(taxons: :taxonomy).uniq.pluck(:id)

      else
        products_ids = Product.joins(taxons: :taxonomy)
                                .where('spree_taxonomies.id IN (?)', params.dig(:ids))
                                  .uniq.pluck(:id)
      end

      @option_types =  OptionType.joins(:products).includes(:option_values)
                              .where('spree_products.id IN (?) AND spree_option_types.show_as_filter = TRUE', products_ids).uniq

      @filter_types = FilterType.joins(:products).includes(:filter_values)
                              .where('spree_products.id IN (?)', products_ids).uniq
    end
  end
end

# touched on 2025-07-09T17:30:47.994730Z
# touched on 2025-07-09T17:39:16.957748Z
# touched on 2025-07-09T17:43:09.057467Z
# touched on 2025-07-09T18:24:52.960945Z
# touched on 2025-07-09T19:42:17.622484Z
# touched on 2025-07-09T21:22:36.524469Z