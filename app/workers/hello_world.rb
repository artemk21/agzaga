class HelloWorld
  include Sidekiq::Worker

  def perform
    puts "Scheduler started......"
  end
end

# touched on 2025-07-09T17:41:53.446458Z
# touched on 2025-07-09T18:15:33.854052Z
# touched on 2025-07-09T18:17:35.336546Z
# touched on 2025-07-09T19:39:05.139158Z