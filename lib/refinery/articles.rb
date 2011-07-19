require 'refinerycms-base'

module Refinery
  module Articles
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "articles"
          plugin.activity = {
            :class => Article}
        end
      end
    end
  end
end
