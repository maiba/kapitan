# _your_login_ - Поменять на ваш логин в панели управления
# _your_project_ - Поменять на имя вашего проекта
# _your_server_ - Поменять на имя вашего сервера (Указано на вкладке "FTP и SSH" вашей панели управления)
# set :repository - Установить расположение вашего репозитория
# У вас должна быть настроена авторизация ssh по сертификатам

# require 'bundler/capistrano'

set :application, "kapitan"
set :repository,  "git://github.com/graycoder/kapitan.git"

dpath = "/home/hosting_tolik925/projects/kapitan"

set :user, "hosting_tolik925"
set :use_sudo, false
set :deploy_to, dpath

set :scm, :git

role :web, "lithium.locum.ru"                          # Your HTTP server, Apache/etc
role :app, "lithium.locum.ru"                          # This may be the same as your `Web` server
role :db,  "lithium.locum.ru", :primary => true # This is where Rails migrations will run

after "deploy:update_code", :copy_database_config
after "deploy:update_code", :install_gems

task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/database.yml"
  db = "#{shared_path}/kapitan.sqlite3"
  run "ln -s #{db_config} #{release_path}/config/database.yml && ln -s #{db} #{release_path}/db/kapitan.sqlite3"
end

task :install_gems, roles => :app do
  run "cd #{release_path} && /var/lib/gems/1.8/bin/bundle install --path=~/.gems"
end

set :unicorn_rails, "/var/lib/gems/1.8/bin/unicorn_rails"
set :unicorn_conf, "/etc/unicorn/kapitan.tolik925.rb"
set :unicorn_pid, "/var/run/unicorn/kapitan.tolik925.pid"

# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run "#{unicorn_rails} -Dc #{unicorn_conf}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_rails} -Dc #{unicorn_conf}"
  end
end