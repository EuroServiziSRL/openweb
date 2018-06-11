require_relative 'boot'

require 'rails/all' #CON QUESTO CARICA LA CARTELLA DEI TEST

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Openweb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    WillPaginate.per_page = 10

    EmailVerifier.config do |config|
      config.verifier_email = "andrea.grazian@soluzionipa.it"
    end
    
    EmailDetected.config do |config|
      config.verifier_email = "andrea.grazian@soluzionipa.it"
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
