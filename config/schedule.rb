set :output, {:standard => '/log/cron.log'}
job_type :rake_bundle,    "cd /var/lib/gems/1.8/bin && RAILS_ENV=:environment bundle exec rake :task :output"

every 1.day do
   rake_bundle "parse:news"
end

