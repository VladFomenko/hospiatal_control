server '64.226.117.60', user: "#{fetch(:user)}", roles: %w{app db web}, primary: true

set :application, 'hospital_control'
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

set :environment, 'production'
set :rails_env,   'production'

set :nginx_server_name, '64.226.117.60'
set :puma_conf, "#{shared_path}/config/puma.rb"