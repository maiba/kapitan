require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Kapitan
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    config.time_zone = 'Kyiv'
    config.i18n.default_locale = :ru
    config.active_record.include_root_in_json = false
    # JavaScript files you want as :defaults (application.js is always included).
    config.action_view.javascript_expansions[:defaults] = %w(library rails)
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.to_prepare do
      Refinery.searchable_models = [Page, NewsItem, Article]
    end
    config.action_mailer.default_url_options = { :host => 'www.kapitan.kh.ua' }
  end
end
