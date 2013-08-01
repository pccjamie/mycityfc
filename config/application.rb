require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Soccer1
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Necessary to add this line to THIS file, not production.rb. required for Heroku - Rails 4 compatability
    # does NOT address OPEN ISSUES with COMPASS_RAILS. That gem is apparently required by Foundation. Not true. 
    # compass-rails is only required to use certain SASS helpers provided by Foundation. Doesn't affect normal SASS and CSS. 
    # WATCHING https://github.com/Compass/compass-rails/pull/59 for ongoing releases.

    config.assets.initialize_on_precompile = false



    ENV['FB_APP_ID']
    ENV['FB_APP_SEC']


  end
end
