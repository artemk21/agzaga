ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.

# touched on 2025-07-09T17:30:18.397004Z
# touched on 2025-07-09T17:32:07.407673Z