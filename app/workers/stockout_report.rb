class StockoutReport
  include Sidekiq::Worker

  def perform
    items = Spree::Variant.joins(:stock_items).where('spree_stock_items.count_on_hand <= 0').order(id: :desc)
    csv_content = CSV.generate( headers: true ) do |csv|
      @csv = csv
      add_header

      items.each do |item|
        add_stockout_items(item)
      end
    end

    if csv_content.present?
      Spree::StockoutMailer.stockout_email(csv_content).deliver_later
    end
  end

  private

  def add_header
    @csv << ['Item Title', 'SKU', 'Backorderable']
  end

  def add_stockout_items item
    item_title = item.name
    if item.options_text.present?
      item_title += " (#{item.options_text})"
    end
    @csv << [ item_title, item.sku, item.is_backorderable? ]
  end
end

# touched on 2025-07-09T17:41:29.834262Z