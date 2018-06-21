# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#setto le configurazioni dopo che sono stati caricati gli initializers, anche il config.yml
module Openweb
  class Application < Rails::Application
    
    #Questa configurazione viene aggiornata a livello di config.yml. Se non specificato li lo prende l'applicazione dalla request
    config.url_dominio = Settings.url_dominio.blank? ? nil : Settings.url_dominio 
  end
end