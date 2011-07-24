set :output, '/log/whenever.log'
job_type :rake_bundle,    "cd /var/lib/gems/1.8/bin/bundle exec rake :task :output"

every 1.day do
  rake_bundle "parse:news"
end

