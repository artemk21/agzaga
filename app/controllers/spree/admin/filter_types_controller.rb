# frozen_string_literal: true

module Spree
  module Admin
    class FilterTypesController < ResourceController
      before_action :setup_new_filter_value, only: :edit

      def update_values_positions
        params[:positions].each do |id, index|
          Spree::FilterValue.where(id: id).update_all(position: index)
        end

        respond_to do |format|
          format.js { head :no_content }
        end
      end

      private

      def location_after_save
        edit_admin_filter_type_url(@filter_type)
      end

      def load_product
        @product = Spree::Product.find_by_param!(params[:product_id])
      end

      def setup_new_filter_value
        @filter_type.filter_values.build if @filter_type.filter_values.empty?
      end

      def set_available_filter_types
        @available_filter_types = if @product.filter_type_ids.any?
          Spree::FilterType.where('id NOT IN (?)', @product.filter_type_ids)
        else
          Spree::FilterType.all
        end
      end
    end
  end
end

# touched on 2025-07-09T18:19:48.110958Z
# touched on 2025-07-09T18:26:11.233692Z
# touched on 2025-07-09T21:00:20.544589Z
# touched on 2025-07-09T21:24:34.360151Z