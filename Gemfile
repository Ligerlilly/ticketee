source 'https://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
group :development, :test do
  gem 'sqlite3', '1.3.7'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'dynamic_form'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do 
  
  gem 'selenium-webdriver'
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  #gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6' 
  gem 'rb-inotify', '~> 0.9'
  gem 'gmail'
  
end

group :development do
 
end

group :test do
  gem 'cucumber', '1.2.5'
  gem 'cucumber-rails', '1.3.0', require: false
  gem 'capybara'
  gem 'database_cleaner', '< 1.1.0'
  gem 'factory_girl'
  gem 'email_spec'
  gem 'launchy'
  gem 'libnotify', '0.8.0'
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

gem 'devise', '~> 1.4.3'
gem 'cancan'
gem 'paperclip', '3.4.2'
gem 'searcher'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
