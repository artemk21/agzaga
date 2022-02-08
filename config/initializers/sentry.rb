if Rails.env.production?
  Sentry.init do |config|
    config.dsn = ENV['SENTRY_DSN']
    config.breadcrumbs_logger = [:active_support_logger]

    config.traces_sampler = lambda do |context|
      false
    end
  end
end

# touched on 2025-07-09T19:38:44.981798Z