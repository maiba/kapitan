require 'refinery'

module Refinery
  module NewsItems
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

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
