require 'refinerycms-base'

module Refinery
  module Offers
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "offers"
          plugin.activity = {
            :class => Offer
          }
        end
      end
    end
  end
end
