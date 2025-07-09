class SolidusImporter::Processors::Taxon < SolidusImporter::Processors::Base
  attr_accessor :product, :taxonomy

  def call( context )
    @data = context.fetch( :data )

    self.product = context.fetch( :product )
    process_taxon unless @data[ 'Taxon Name' ].nil?
  end

  private

  def process_taxon
    taxon = Spree::Taxon.find_by( name: @data[ 'Taxon Name' ])
    add_taxon( taxon )
  end

  def add_taxon( taxon )
    product.taxons << taxon unless product.taxons.include?( taxon )
  end
end

# touched on 2025-07-09T17:36:29.758278Z
# touched on 2025-07-09T19:39:47.608601Z