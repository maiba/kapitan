set :application, "kapitan"
set :repository,  "git://github.com/gagarin-in-ua/kapitan.git"
set :account, "tolik925"
set :user, "hosting_tolik925"
set :db_file, "kapitan.sqlite3"

set :scm, :git
set :use_sudo, false
set :deploy_to, "/home/#{user}/projects/#{application}"
set :bundle, "/var/lib/gems/1.8/bin/bundle"
set :rake, "#{bundle} exec rake"
set :unicorn_rails, "/var/lib/gems/1.8/bin/unicorn_rails"
set :unicorn_conf, "/etc/unicorn/#{application}.#{account}.rb"
set :unicorn_pid, "/var/run/unicorn/#{application}.#{account}.pid"

role :web, "lithium.locum.ru"
role :app, "lithium.locum.ru"
role :db,  "lithium.locum.ru", :primary => true

namespace :dragonfly do

  desc "Symlink the Rack::Cache files"
  task :symlink, :roles => :app do
    run "mkdir -p #{shared_path}/tmp/dragonfly && ln -nfs #{shared_path}/tmp/dragonfly #{release_path}/tmp/dragonfly"
  end

end

namespace :deploy do

  desc "Start application"
  task :start, :roles => :app do
    run "cd #{deploy_to}/current && #{bundle} exec unicorn_rails -Dc #{unicorn_conf}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_rails} -Dc #{unicorn_conf}"
  end

  desc "Make symlinks for application config files"
  task :copy_configs, roles => :app do
    run "ln -s #{shared_path}/initializers/mail.rb #{release_path}/config/initializers/mail.rb"
    run "ln -s #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -s #{shared_path}/db/#{db_file} #{release_path}/db/#{db_file}"
  end

  desc "Install bundler gems"
  task :bundle_install, roles => :app do
    run "cd #{release_path} && #{bundle} install --path=~/.gems"
  end

end

after 'deploy:update_code', 'dragonfly:symlink'
after "deploy:update_code", 'deploy:copy_configs'
after "deploy:update_code", 'deploy:bundle_install'