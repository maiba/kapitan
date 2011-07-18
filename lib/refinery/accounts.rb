require 'refinerycms-base'

module Refinery
  module Accounts
    class Engine < Rails::Engine
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "accounts"
          plugin.class_name = 'SiteAccounts'
          plugin.activity = {
            :class => Account
          }
        end
      end
    end
  end
end
