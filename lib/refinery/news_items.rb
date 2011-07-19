require 'refinery'

module Refinery
  module NewsItems
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "news_items"
          plugin.activity = {
            :class => NewsItem}
        end
      end
    end
  end
end
