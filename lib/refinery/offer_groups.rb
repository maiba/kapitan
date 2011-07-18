require 'refinerycms-base'

module Refinery
  module Offer::Groups
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "offer_groups"
          plugin.activity = {
            :class => Offer::Group
          }
        end
      end
    end
  end
end
