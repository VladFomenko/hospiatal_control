source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use for authorization
gem 'devise'

# Use for page style
gem 'bootstrap'

# Use for turbo-link for bootstrap
gem 'jquery-rails'
gem 'popper_js'

# Use for admin panel
gem 'administrate'

# Use for passwords
gem 'dotenv-rails'

# Use error deploy
gem 'execjs'

# Use for permissions
gem 'cancancan'

# Use for amazon
gem 'aws-sdk-s3', require: false

# Use for pagi
gem 'kaminari', '~> 1.2', '>= 1.2.2'

group :development, :test do
  # Use for test
  gem 'rspec-rails'
  gem 'capybara'

  # Use for data got DB
  gem 'ffaker'
  gem 'factory_bot_rails'

  # Use for debug
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Use for deploy
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-nginx'
  gem 'capistrano-upload-config'
  gem 'sshkit-sudo'
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Use for style guide
  gem 'rubocop', '~> 1.51', require: false

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
