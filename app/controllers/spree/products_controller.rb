# frozen_string_literal: true

module Spree
  class ProductsController < Spree::StoreController
    before_action :load_product, only: [:show, :show_related, :related_products_cards, :reviews_form, :question_form]
    before_action :load_data, :add_to_recently_viewed, only: [:show, :product_page]
    before_action :load_taxon, only: :index
    before_action :load_deals, only: :deals
    before_action :related_products, only: [:show_related, :related_products_cards]
    before_action :visiable_review_count, only: [:show, :product_page, :product_reviews]
    helper 'spree/taxons', 'spree/taxon_filters'
    respond_to :html
    include Products::ProductFilters
    include Products::Cards

    def index
      @products = load_products

      load_product_cards(@products)
      @staff_pick_product_cards = load_product_cards(@staff_pick_products) unless @products.present?
      @featured_products = Spree::Product.featured_products
      @taxonomies = Spree::Taxonomy.where(visibility: true).includes(root: :children)
    end

    def show
      @product_question = Spree::ProductQuestion.new(product: @product)
      @review = Spree::Review.new(product: @product)
      @visible_taxons = @product.taxons.where(visibility: true)

      if params[:highest_rating].present?
        @product_reviews = @product.reviews.approved.reorder('spree_reviews.rating DESC')

      elsif params[:lowest_rating].present?
        @product_reviews = @product.reviews.approved.reorder('spree_reviews.rating ASC')
      else
        @product_reviews = @product.reviews.approved
      end

      if params[:for_desktop]
        @product_reviews = Kaminari.paginate_array(@product_reviews).page(params[:page] || 1).per(3)
      else
        @product_reviews = Kaminari.paginate_array(@product_reviews).page(1).per(@reviews_count)
      end

      respond_to do |format|
        format.js
        format.html
      end
    end

    def gift_page
      @group_products = Spree::View::AvailableGiftProduct.includes(:product_card, :master, products: :product_card)
    end

    def quick_view
      @product = Spree::Product.find(params[:id])

      respond_to do |format|
        format.js
      end
    end

    def show_related
      respond_to do |format|
        format.js
      end
    end

    def product_reviews
      id = params[:product_id]
      stars = params[:stars]
      @product_reviews = Spree::Product.find(id).reviews.approved.where("rating BETWEEN ? AND ?", stars.to_f-1, stars )
      @product_reviews = Kaminari.paginate_array(@product_reviews).page(1).per(@reviews_count)
      respond_to do |format|
        format.js
      end
    end

    def reviews_form
      @review = Spree::Review.new(product: @product)
    end

    def question_form
      @question = Spree::ProductQuestion.new(product: @product)
    end

    def stock_update_notification
      @product_variant = Spree::Variant.find(params[:my_field])
      respond_to do |format|
        format.js
      end
    end

    def related_products_cards
      respond_to do |format|
        format.js
      end
    end

    private
    def category_params
      params.permit(category: [])
    end

    def load_deals
      @taxons = Spree::View::TaxonWithOnSaleProduct.all
      @taxonmies = Spree::Taxonomy.where(id: @taxons.pluck(:taxonomy_id).uniq).includes(:root)

      if category_params[:category].present?
        taxon_ids = category_params[:category].map(&:to_i)
        taxon_ids << Spree::Taxon.find(taxon_ids).map{|t| t.descendants.pluck(:id)}

        @products = Spree::Product.joins(:taxons).where("spree_taxons.id IN (?)", taxon_ids.flatten).select("spree_products.id")
        @products = Spree::View::OnSaleProductsOrderByStaffPicks.where(id: @products.pluck(:id))
      else
        @products = Spree::View::OnSaleProductsOrderByStaffPicks.all
      end

      filter_by_sale_price if params[:filter_by_price].present?
      order_products if params[:order_by].present?

      @products =  Kaminari.paginate_array(@products.uniq).page(params.dig(:page) || 1 ).per(48)

      load_product_cards(@products)
    end

    def title
      return 'Agzaga - Deals' if action_name == 'deals'

      super
    end

    def accurate_title
      if @product
        @product.meta_title.blank? ? @product.name : @product.meta_title
      else
        super
      end
    end

    def load_product
      if try_spree_current_user.try(:has_spree_role?, "admin")
        @products = Spree::Product.with_discarded
      else
        @products = Spree::Product.available
      end

      @product = @products.includes(:variants, :taxons).friendly.find(params[:id])
    end

    def load_taxon
      @taxon = Spree::Taxon.where(visibility: true).find(params[:taxon]) if params[:taxon].present?
    end

    def load_data
      @product_properties = @product.product_properties.includes(:property)

      if params[:highest_rating].present?
        @reviews = @product.reviews.reorder('spree_reviews.rating DESC').page(params[:reviews_page] || 1 ).per(3)

      elsif params[:lowest_rating].present?
        @reviews = @product.reviews.reorder('spree_reviews.rating ASC').page(params[:reviews_page] || 1 ).per(3)

      else
        @reviews = @product.reviews.page(params[:reviews_page] || 1 ).per(3)
      end

      @product_questions = @product.product_questions.page(params[:questions_page] || 1 ).per(3)
    end

    def related_products
      related_products_ids = []

      if @product.taxons.pluck(:name).include?('Net Wrap')
        related_products_ids = related_net_wraps(related_products_ids)
      end

      if related_products_ids.count <= 4
        add_related_products_by_taxons(related_products_ids)
      end

      if related_products_ids.count <= 4
        add_related_products_by_parent_taxons(related_products_ids)
      end

      if related_products_ids.count <= 4
        fill_related_products_with_featured(related_products_ids)
      end

      offset = params[:offset].present? ? params[:offset] : 0
      limit = params[:limit].present? ? params[:limit] : 4

      @related_products = Spree::Product.available.where(id: related_products_ids.uniq).where.not(id: @product.id)
      @product_cards_count = @related_products.count

      @related_products = @related_products.offset(offset).limit(limit).sort_by { |product| related_products_ids.index(product.id) }
      load_product_cards(@related_products)
    end

    def related_net_wraps(related_products_ids)
      selected_product_sku = @product.sku
      if selected_product_sku == ''
        selected_product_sku = @product.variants.where.not(sku: '').first&.sku
        return related_products_ids if selected_product_sku.nil?
      end

      sku_dimensions = selected_product_sku&.split('.')&.[](2)
      return [] unless sku_dimensions.present?

      Spree::Product.joins(:taxons).where("spree_taxons.name = 'Net Wrap'").each do |product|
        if product.sku&.split('.')&.[](2) == sku_dimensions || product.variants.any? { |variant| variant.sku&.split('.')&.[](2) == sku_dimensions }
          related_products_ids << product.id unless @product.id == product.id
        end
      end

      related_products_count = related_products_ids.uniq.count

      if related_products_count <= 4
        Spree::Product.joins(:taxons).where("spree_taxons.name = 'Net Wrap'").each do |product|
          if product.sku&.split(/[. -]/)&.[](2) == sku_dimensions&.split('-')&.[](0) || product.variants.any? { |variant| variant.sku&.split(/[. -]/)&.[](2) == sku_dimensions&.split('-')&.[](0) }
            related_products_ids << product.id unless @product.id == product.id
            related_products_count += 1
          end
          break if related_products_count > 4
        end
      end

      related_products_ids.uniq
    end

    def add_related_products_by_taxons(related_products_ids)
      @product.taxons.each do |taxon|
        related_products_ids.concat(taxon.products.pluck(:id))
        related_products_ids.uniq!
        break if related_products_ids.count > 4
      end
    end

    def add_related_products_by_parent_taxons(related_products_ids)
      @product.taxons.each do |taxon|
        if taxon.parent.present?
          related_products_ids.concat(taxon.parent.products.pluck(:id))
        end
        related_products_ids.uniq!
        break if related_products_ids.count > 4
      end
    end

    def fill_related_products_with_featured(related_products_ids)
      Spree::Product.featured_products.each do |featured_product|
        related_products_ids << featured_product.id
        related_products_ids.uniq!
        break if related_products_ids.count > 4
      end
    end

    def add_to_recently_viewed
      if spree_user_signed_in?
        session[:recently_viewed_products] ||= []
        session[:recently_viewed_products] << @product.id
      end
    end

    def visiable_review_count
      @reviews_count = 0
      if (params[:count].present? && params[:count].to_i == 3)
        @reviews_count = 10
      elsif (params[:count].present?)
        @reviews_count = params[:count].to_i + 10
      else
        @reviews_count = 3
      end
    end
  end
end

# touched on 2025-07-09T17:34:41.053908Z