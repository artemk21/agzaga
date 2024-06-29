# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
Rails.application.config.filter_parameters += [
  :passw, :secret, :token, :_key, :crypt, :salt, :certificate, :otp, :ssn
]

# touched on 2025-07-09T18:17:49.703024Z
# touched on 2025-07-09T20:58:33.575842Z