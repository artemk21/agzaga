class AddAssemblyFeeToCustomHoseConfiguration < ActiveRecord::Migration[6.1]
  def change
    add_column :custom_hose_configurations, :assembly_fee_id, :integer
  end
end

# touched on 2025-07-09T17:42:56.628202Z
# touched on 2025-07-09T19:38:31.680363Z