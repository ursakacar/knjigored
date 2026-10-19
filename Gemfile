source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.0.3'
# json 3 dropped the quirks_mode option that ActiveSupport 8.0 still passes
gem 'json', '< 3'
# Use postgres as the database for Active Record
gem 'pg', '~> 1.5'
# Use Puma as the app server
gem 'puma', '~> 7.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# JavaScript with ESM import maps, no Node/bundler needed. Read more: https://github.com/rails/importmap-rails
gem 'importmap-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Rubocop linter
gem "rubocop-rails", require: false

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri windows]

  # debugging
  gem 'pry'
  gem 'pry-nav'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  # Selenium 4.11+ downloads browser drivers itself (replaces the webdrivers gem)
  gem 'selenium-webdriver', '>= 4.11'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]
