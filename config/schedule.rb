job_type :rake_bundle,    "/var/lib/gems/1.8/bin/bundle exec rake :task"

every 1.day do
  rake_bundle "parse:news"
end

