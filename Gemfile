source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'

gem 'rails', '5.2.1'

# Use PG as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.7.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'haml-rails'

gem 'foundation-rails'
gem 'autoprefixer-rails'

gem 'jquery-rails'

gem 'serviceworker-rails'

gem 'devise'
gem 'devise-foundation-views'
gem 'omniauth-google-oauth2'

gem 'material_design_iconsfont', git: 'https://github.com/AquisTech/material_design_iconsfont'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "capybara"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "database_cleaner"
  gem "faker"
  gem "shoulda-matchers", require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit'
  gem 'bundler-audit'
  gem 'haml-lint'
  # gem 'niceql'
  # gem 'pp_sql' # TODO: Modify and use
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
