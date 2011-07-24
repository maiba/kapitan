set :output, {:standard => '/log/cron.log'}

every 1.day do
   rake "parse:news"
end

