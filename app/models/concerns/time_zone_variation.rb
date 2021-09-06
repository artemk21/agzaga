module TimeZoneVariation
  extend ActiveSupport::Concern

  included do
    def time_zone_variation(*args)
      args.each do |arg|
        if self.send("#{arg}_changed?")
          self[arg] += (5 * 60 * 60) unless self[arg].nil?
        end
      end
    end
  end
end

# touched on 2025-07-09T17:35:15.463055Z
# touched on 2025-07-09T18:24:38.251859Z
# touched on 2025-07-09T18:24:52.961647Z