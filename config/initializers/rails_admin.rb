module RailsAdmin
    module Extensions
        module CanCanCan2
            class AuthorizationAdapter < RailsAdmin::Extensions::CanCanCan::AuthorizationAdapter
                #In questi metodi posso abilitare o no i modelli che si possono usare
                
                def authorize(action, abstract_model = nil, model_object = nil)
                    return unless action
                    reaction, subject = fetch_action_and_subject(action, abstract_model, model_object)
                    @controller.current_ability.authorize!(reaction, subject)
                end
    
                def authorized?(action, abstract_model = nil, model_object = nil)
                    return unless action
                    reaction, subject = fetch_action_and_subject(action, abstract_model, model_object)
                    @controller.current_ability.can?(reaction, subject)
                end
    
                def fetch_action_and_subject(action, abstract_model, model_object)
                    reaction = action
                    subject = model_object || abstract_model&.model
                    unless subject
                    subject = reaction
                    reaction = :read
                    end
                    return reaction, subject
                end
          end
        end
    end
end

RailsAdmin.add_extension(:cancancan2, RailsAdmin::Extensions::CanCanCan2, authorization: true)


RailsAdmin.config do |config|

  ### Popular gems integration

  # == Devise ==
   config.authenticate_with do
     warden.authenticate! scope: :user
   end
   config.current_user_method(&:current_user)

  ## == Cancan ==
  #config.authorize_with :cancan

  ## == CanCanCan ==
  config.authorize_with :cancancan2, AdminAbility

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  
  
  config.model 'AuthHub::ClientiApplicazione' do
    label "Applicazione" 
    label_plural "Applicazioni"
  end
  config.model 'AuthHub::ClientiInstallazione' do
    label "Installazione" 
    label_plural "Installazioni"
  end
  config.model 'AuthHub::ClientiCliente' do
    label "Cliente" 
    label_plural "Clienti"
  end
  config.model 'AuthHub::ClientiAllegato' do
    label "Allegato" 
    label_plural "Allegati"
  end
  config.model 'AuthHub::ClientiApplinstallate' do
    label "App Installata" 
    label_plural "App Installate"
  end
  config.model 'AuthHub::ClientiAttivazione' do
    label "Attivazione" 
    label_plural "Attivazioni"
  end
   config.model 'AuthHub::ClientiDettordine' do
    label "Dettaglio Ordine" 
    label_plural "Dettaglio Ordini"
  end
   config.model 'AuthHub::ClientiLinkfunzione' do
    label "Link Funzione" 
    label_plural "Link Funzioni"
  end
   config.model 'AuthHub::ClientiOrdine' do
    label "Ordine" 
    label_plural "Ordini"
  end
   config.model 'AuthHub::ClientiScadenza' do
    label "Scadenza" 
    label_plural "Scadenze"
  end
   config.model 'AuthHub::ClientiServer' do
    label "Server" 
    label_plural "Servers"
  end
   config.model 'AuthHub::ClientiStatistica' do
    label "Statistica" 
    label_plural "Statistiche"
  end
   config.model 'AuthHub::ClientiTipostatistica' do
    label "Tipo Statistica" 
    label_plural "Tipi Statistica"
  end
  config.model 'AuthHub::User' do
    label "Utente" 
    label_plural "Utenti"
  end
  config.model 'AuthHub::EnteGestito' do
    label "Ente Gestito" 
    label_plural "Enti Gestiti"
  end
  
  
  config.parent_controller = 'ApplicationController'
  
  
  
end
