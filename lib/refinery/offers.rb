require 'refinerycms-base'

module Refinery
  module Offers
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

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
