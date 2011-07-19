require 'refinery'

module Refinery
  module Ads
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "ads"
          plugin.activity = {
            :class => Ad}
        end
      end
    end
  end
end
