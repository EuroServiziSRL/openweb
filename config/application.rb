require_relative 'boot'

require 'rails/all' #CON QUESTO CARICA LA CARTELLA DEI TEST

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Openweb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    #rack-cors -> usato file cors.rb in initializers
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end
    
    config.i18n.available_locales = :it
    config.i18n.default_locale = :it

    config.time_zone = "Rome"
    #Imposta i corretti valori di created_at su activerecord
    config.active_record.default_timezone = :local 

    WillPaginate.per_page = 15

    #mail che viene usata solo per verificare l'esistenza di una mail in fase
    #di registrazione dell'utente
    EmailVerifier.config do |config|
      config.verifier_email = "assistenza@soluzionipa.it"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    config.autoload_paths << "#{config.root}/lib"
  end
end
