source 'https://rubygems.org'
ruby '2.0.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

#DEPENDENCIES

#db
gem 'pg'

#server
# gem 'thin'


#gem 'daemons'
gem 'delayed_job_active_record'

# Use SCSS for stylesheets
gem 'sass-rails'
 # '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby


# Use jquery as the JavaScript library
gem 'jquery-rails'

#time parser
gem 'chronic'

#foundation
# gem 'foundation-icons-sass-rails'
# gem 'compass-rails' # you need this or you get an err
# gem "compass-rails", github: "milgner/compass-rails", ref: "1749c06f15dc4b058427e7969810457213647fb8"
gem 'zurb-foundation', '~> 4.0.0'
#gem "trollop", "~> 2.0"

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

#background jobs

#gem 'resque'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end



#RAIL 4S compatability

# to be able to deploy to Heroku
group :production do
  gem 'rails_12factor'
end

# keeping this so Devise will cooperate for now.
gem "protected_attributes", "~> 1.0.0"

#AUTHENTICATION
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'figaro'

#CORS
gem 'rack-cors', :require => 'rack/cors'


###CONTENT DELIVERY

#vids


#scraping, json, etc
gem 'httparty' # for espn data
gem 'nokogiri'
# gem 'twitter'

#geocoding
gem 'geocoder'

#utility
gem "activesupport"   #, "~> 3.1.1"
#forecast
# gem 'forecast_io'
  


#DEV

group :development do
  gem "debugger"
  gem 'pry-debugger'
  #gem 'better_errors'
end

  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'quiet_assets'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'annotate'

#TEST

  # gem 'factory_girl_rails'
  # gem 'rspec-rails'
  # gem 'shoulda-matchers'
  # gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  #gem 'cucumber-rails', :require => false
  # gem 'launchy'
  # gem 'database_cleaner'
  # gem 'guard-rspec'
  # gem 'faker'



gem 'newrelic_rpm'


