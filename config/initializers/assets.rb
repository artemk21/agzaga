# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# ckeditor assests
Rails.application.config.assets.precompile += %w( ckeditor/*)

# touched on 2025-07-09T17:33:17.978050Z
# touched on 2025-07-09T18:16:48.839623Z
# touched on 2025-07-09T21:22:19.484431Z