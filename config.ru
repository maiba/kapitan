require 'rack-rewrite'

DOMAIN = 'www.kapitan.kh.ua'

# Redirect to the www version of the domain in production
use Rack::Rewrite do
  r301 %r{.*}, "http://#{DOMAIN}$&", :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] != DOMAIN && ENV['RACK_ENV'] == "production"
  }
end

# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Kapitan::Application
