module Spree
  class CustomHoseGeneratorController < Spree::StoreController
    def index
      @custom_hose_variants = Spree::Product.where(product_type: 'custom_hose').last.variants
      @hose_fittings = Spree::Product.where(product_type: 'hose_fitting').last.variants
      @hose_assembly_fee = Spree::Product.where(product_type: 'assembly_fee').last
    end
  end
end

# touched on 2025-07-09T17:43:09.059637Z
# touched on 2025-07-09T20:56:38.669086Z
# touched on 2025-07-09T20:57:42.079458Z
# touched on 2025-07-09T21:01:19.776114Z