require 'refinerycms-base'

module Refinery
  module Orders
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "orders"
          plugin.activity = {
            :class => Order,
            :title => 'id'
          }
        end
      end
    end
  end
end
