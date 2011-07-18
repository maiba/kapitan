require 'refinerycms-base'

module Refinery
  module Services
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "services"
          plugin.activity = {
            :class => Service
          }
        end
      end
    end
  end
end
