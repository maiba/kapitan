require 'refinerycms-base'

module Refinery
  module ServicePackages
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "service_packages"
          plugin.activity = {
            :class => Service::Package
          }
        end
      end
    end
  end
end
