# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

#setto le configurazioni dopo che sono stati caricati gli initializers, anche il config.yml
module Openweb
  class Application < Rails::Application
    
    #Questa configurazione viene aggiornata a livello di config.yml. Se non specificato li lo prende l'applicazione dalla request
    config.url_dominio = Settings.url_dominio.blank? ? nil : Settings.url_dominio 
    
    # #chiamo lo scheduler per inviare i metadati ad agid
    # begin
    #   #AuthHub::InviaMetadataJob.perform_later 'val'
    #   AuthHub::InviaMetadataJob.set(wait: 2.minutes).perform_later('val')
    # rescue => exc
    #   logger.error exc.message
    #   logger.error exc.backtrace.join("\n")
    # end
    
    
  end
end