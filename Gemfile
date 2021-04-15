source 'https://rubygems.org'

ruby "2.6.3"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'activemodel', '= 5.2.4.3'
# gem 'activesupport', '= 5.2.4.3'

gem 'rails', '5.2.4.3'

gem 'railties', '5.2.4.3'

gem 'config', '= 2.0.0'
gem 'sass-rails', '= 5.0.7'
gem 'bootstrap-sass', '= 3.3.7'
gem 'autoprefixer-rails'#, '= 9.6.1'
gem 'addressable', '~> 2.6'

gem 'rack-cors', '= 1.1.1' , require: 'rack/cors'

gem 'mysql2', '= 0.5.3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '= 4.2.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'execjs', '= 2.7.0'

# Use CoffeeScript for .coffee assets and views
#gem 'coffee-rails', '= 4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '= 5.1.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '= 2.7.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  #gem 'capybara', '~> 2.13'
  #gem 'selenium-webdriver'
  #gem 'derailed_benchmarks' #per vedere consumo di memoria
end

group :development do
  # Use Puma as the app server
  gem 'puma', '= 4.3.5'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  #gem 'web-console', '>= 3.3.0'
  gem 'listen'#, '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen' #, '~> 2.0.0'
end

gem 'multiverse', '= 0.2.0'   #permette di usare n database
#gem 'rmre','= 0.0.9'      #crea i models partendo da un database 
gem 'jquery-rails'#, '>= 4.3.3' #jquery e Unobtrusive scripting adapter
gem 'webpacker', '= 3.5.5'
gem 'devise'#, '~> 4.7'
#gem 'devise_security_extension', '0.10.0', git: 'https://github.com/phatworx/devise_security_extension.git' #le gemma non la installa, vuole railties < 5.0
gem 'devise-security','0.11.1'
gem 'jwt' #,'>= 1.5.2'
gem 'omniauth' #, '= 1.9.0'
gem 'omniauth-azure-oauth2' #, '= 0.0.10'
#gem 'adal' #, '= 1.0.0'
gem 'font-awesome-sass', '= 4.7.0'
gem 'font-ionicons-rails', '= 2.0.1.5'
gem 'material_design_icons_rails', '= 1.0.0'
#gem 'weather-icons-for-rails'

gem 'cancancan', '= 2.2.0'
gem 'rails_admin','= 1.4.3'#, git: 'https://github.com/sferik/rails_admin.git'
gem 'filterrific', '= 5.2.0'
gem 'will_paginate', '= 3.3.0'
gem 'email_verifier', '= 0.1.0' #verifica mail in fase di registrazione

gem 'doorkeeper', '= 5.3.1'
gem 'doorkeeper-jwt', '0.2.1'

gem 'jwe', '= 0.4.0'
gem 'carrierwave'#, '= 2.1.1'
gem 'rubyzip', '= 2.3.0'
gem 'httparty', '= 0.18.0'

gem 'auth_hub', path: 'engines/auth_hub'
gem 'wiki_hd', path: 'engines/wiki_hd'
