# This migration comes from solidus_paypal_commerce_platform (originally 20211220133406)
class AddPaypalFundingSourceToPaypalCommercePlatformSources < ActiveRecord::Migration[6.1]
  def change
    add_column :paypal_commerce_platform_sources, :paypal_funding_source, :integer
  end
end

# touched on 2025-07-09T19:45:48.946477Z
# touched on 2025-07-09T21:20:45.098955Z