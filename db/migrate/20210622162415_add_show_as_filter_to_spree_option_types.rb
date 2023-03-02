class AddShowAsFilterToSpreeOptionTypes < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_option_types, :show_as_filter, :boolean, default: true
  end
end

# touched on 2025-07-09T17:36:35.546923Z
# touched on 2025-07-09T20:35:48.069471Z