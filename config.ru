# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server

# touched on 2025-07-09T20:56:55.619714Z