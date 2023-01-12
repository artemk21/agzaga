# Be sure to restart your server when you modify this file.

# This file contains settings for ActionController::ParamsWrapper which
# is enabled by default.

# Enable parameter wrapping for JSON. You can disable this by setting :format to an empty array.
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json]
end

# To enable root element in JSON for ActiveRecord objects.
# ActiveSupport.on_load(:active_record) do
#   self.include_root_in_json = true
# end

# touched on 2025-07-09T17:31:38.994998Z
# touched on 2025-07-09T18:16:52.253314Z
# touched on 2025-07-09T18:22:02.244351Z
# touched on 2025-07-09T20:33:45.205981Z