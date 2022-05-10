Rails.application.load_tasks

class SitemapWorker
  include Sidekiq::Worker

  def perform
    Rake::Task['sitemap:refresh'].reenable
    Rake::Task['sitemap:clean'].execute
    Rake::Task['sitemap:refresh'].invoke
  end
end

# touched on 2025-07-09T17:30:02.152798Z
# touched on 2025-07-09T17:36:29.758978Z
# touched on 2025-07-09T18:27:55.069300Z
# touched on 2025-07-09T19:41:06.782138Z