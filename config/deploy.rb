# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "funnycars"
set :repo_url, "https://github.com/TazzyG/funnycars.git"

set :deploy_to, '/home/laurie/funnycars'

set :pty,             true
set :use_sudo,        false
set :deploy_via, :remote_cache
set :deploy_to, '/home/laurie/funnycars'
set :rvm_ruby_version, '2.4.0'

set :pty,             true
set :use_sudo,        false
set :deploy_via, :remote_cache



set :linked_files, %w{config/database.yml}
set :linked_files, %w{config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_files, %w{.env}

set :passenger_restart_with_touch, true

set :ssh_options,     { forward_agent: true, user: "laurie", keys: %w(~/.ssh/id_rsa) }

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end


  desc 'Restart application'
  task :restart, :clear_cache do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
  after :finishing,  :cleanup
end

set :linked_files, %w{config/database.yml}
set :linked_files, %w{config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :linked_files, %w{.env}

set :passenger_restart_with_touch, true

set :ssh_options,     { forward_agent: true, user: "laurie", keys: %w(~/.ssh/id_rsa) }

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end


  desc 'Restart application'
  task :restart, :clear_cache do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
  after :finishing,  :cleanup
end