require 'dotenv'
Dotenv.load


# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"
# lock "~> 3.5.0"

set :rvm_type, :user
set :rvm_ruby_version, '2.3.1@glass'


set :application, "glass"
set :repo_url, 'git@github.com:cmramseyer/glass.git' # ENV['REPO_URL']



# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, ENV['DEPLOY_PATH']

set :unicorn_config_path, ENV['CONFIG_UNICORN_PATH']


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/cable.yml", "config/secrets.yml", ".env"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
