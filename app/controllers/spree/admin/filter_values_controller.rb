# frozen_string_literal: true

module Spree
  module Admin
    class FilterValuesController < Spree::Admin::BaseController
      def destroy
        filter_value = Spree::FilterValue.find(params[:id])
        filter_value.destroy
        render plain: nil
      end
    end
  end
end

# touched on 2025-07-09T17:35:39.052881Z