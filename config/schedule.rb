set :output, '/log/whenever.log'

every 1.day do
  rake "parse:news"
end

