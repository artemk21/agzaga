# frozen_string_literal: true

module Spree
  class StoreController < Spree::BaseController
    include Spree::Core::ControllerHelpers::Pricing
    include Spree::Core::ControllerHelpers::Order
    before_action :google_ad_gclid

    def unauthorized
      render 'spree/shared/unauthorized', layout: Spree::Config[:layout], status: 401
    end

    def cart_link
      render partial: 'spree/shared/link_to_cart'
      fresh_when(current_order, template: 'spree/shared/_link_to_cart')
    end

    private

    def config_locale
      Spree::Frontend::Config[:locale]
    end

    def lock_order
      Spree::OrderMutex.with_lock!(@order) { yield }
    rescue Spree::OrderMutex::LockFailed
      flash[:error] = t('spree.order_mutex_error')
      redirect_to spree.cart_path
    end

    def google_ad_gclid
      session[:google_ad_gclid] = params.dig(:gclid) if params.dig(:gclid).present?
    end
  end
end

# touched on 2025-07-09T17:31:45.137720Z
# touched on 2025-07-09T19:38:57.563617Z