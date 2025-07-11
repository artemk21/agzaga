class SolidusImporter::Processors::Shipment < SolidusImporter::Processors::Base
  attr_accessor :variant

  def call( context )
    @data = context.fetch( :data )
    self.variant = context.fetch( :variant ) || raise( ArgumentError, 'missing :variant in context' )

    context.merge!( stockitem: process_stockitem )
  end

  private

  def process_stockitem
    stock_location = Spree::StockLocation.find_by( name: @data[ 'Stock Location Name' ] ) unless  @data[ 'Stock Location Name' ].nil?
    stock_location = Spree::StockLocation.first if stock_location.nil?
    stockitem = Spree::StockItem.create( stock_location_id: stock_location.id )

    variant.stock_items <<  stockitem unless variant.stock_items.include?( stockitem )

    variant.stock_items.each do |stock_item|

      if stock_item.variant_id == stockitem.variant_id
        Spree::StockMovement.create( quantity: @data[ 'Stock' ] || 0, stock_item: stock_item )
      end
    end
  end
end

# touched on 2025-07-09T17:34:07.449179Z
# touched on 2025-07-09T20:40:29.267028Z
# touched on 2025-07-09T20:57:34.092146Z