class HelloWorld
  include Sidekiq::Worker

  def perform
    puts "Scheduler started......"
  end
end

# touched on 2025-07-09T17:41:53.446458Z