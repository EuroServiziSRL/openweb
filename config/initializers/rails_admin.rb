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
  
  config.excluded_models << "AuthHub::ClientiLinkfunzione"
  config.excluded_models << "AuthHub::ClientiDettordine"
  config.excluded_models << "AuthHub::ClientiScadenza"
  config.excluded_models << "AuthHub::ClientiStatistica"
  config.excluded_models << "AuthHub::ClientiTipostatistica"
  config.excluded_models << "AuthHub::ClientiApplicazioneRefClientiOrdine"
  config.excluded_models << "AuthHub::ClientiAllegato"
  config.excluded_models << "AuthHub::ClientiOrdine"
  config.excluded_models << "AuthHub::ApplicazioniEnte"
  config.excluded_models << 'AuthHub::Setup'
  #tolti per non avere problemi su migration..non servono..
  config.excluded_models << 'ActiveStorage::Blob'
  config.excluded_models << 'ActiveStorage::Attachment'
  #escludo tabelle doorkeeper..i modelli devono avere auth_hub ma le tabelle no, crea casini...
  #escludo da rails_admin per non avere errore entrando su rails_admin
  config.excluded_models << "AuthHub::OauthAccessGrant"
  config.excluded_models << "AuthHub::OauthAccessToken"
  config.excluded_models << "AuthHub::OauthApplication"
  config.excluded_models << "AuthHub::OldPasswords"

  config.excluded_models << "AuthHub::Version"
  config.excluded_models << "WikiHd::Version"
  
  config.model 'AuthHub::MasterSetup' do
    label "Setup" 
    label_plural "Setups"
    list do
        exclude_fields :CR_DATE, :MOD_DATE, :CR_USER_ID, :MOD_USER_ID,:PERMS
    end
    object_label_method do
        :ID
    end
  end
  config.model 'AuthHub::ClientiApplicazione' do
    label "Applicazione" 
    label_plural "Applicazioni"
    list do
        exclude_fields :CR_DATE, :MOD_DATE, :CR_USER_ID, :MOD_USER_ID,:PERMS, :AREA, :ID_LINKFUNZIONI
    end
    object_label_method do
        :NOME
    end
  end
  config.model 'AuthHub::ClientiInstallazione' do
    label "Installazione" 
    label_plural "Installazioni"
    field :id do
      label 'Id'
    end
    field :CLIENTE do
      label 'Cliente'
    end
    field :SERVER do
      label 'Server'
    end
    field :SPIDERURL do
      label 'Url Portale Spider'
    end
    field :HIPPO do
      label 'Url Portale Hippo'
    end
    field :SPIDERDB do
      label 'Nome DB'
    end
    include_all_fields
    list do
        exclude_fields :CR_DATE, :MOD_DATE, :CR_USER_ID, :MOD_USER_ID,:PERMS,:ID_APPLICAZIONI,:CODICEFISCALE,:PARTITAIVA,:ID_ANAGRAFICA,:BELFIORE
    end
    object_label_method do
        :CLIENTE
    end
  end
  config.model 'AuthHub::ClientiCliente' do
    label "Cliente" 
    label_plural "Clienti"
    list do
        exclude_fields :CR_DATE, :MOD_DATE, :CR_USER_ID, :MOD_USER_ID,:PERMS
    end
    show do
        exclude_fields :enti_gestiti
    end
    edit do
        exclude_fields :enti_gestiti
    end
    object_label_method do
        :CLIENTE
    end
  end
  config.model 'AuthHub::ClientiAllegato' do
    label "Allegato" 
    label_plural "Allegati"
    list do
        exclude_fields :CR_DATE, :MOD_DATE, :CR_USER_ID, :MOD_USER_ID,:PERMS
    end
  end
  config.model 'AuthHub::ClientiApplinstallate' do
    label "App Installata" 
    label_plural "App Installate"
    list do
        exclude_fields :CR_DATE, :CR_USER_ID, :MOD_USER_ID,:PERMS
    end
    object_label_method do
        :APPLICAZIONE
    end
  end
  config.model 'AuthHub::ClientiAttivazione' do
    label "Attivazione" 
    label_plural "Attivazioni"
    list do
        exclude_fields :CR_DATE, :MOD_DATE, :CR_USER_ID, :MOD_USER_ID,:PERMS, :VIRTUALHOST, :PACCHETTO,:REPOSITORY,:COMMIT,:DEPLOY,:ID_SERVER
    end
    object_label_method do
        :custom_label_method
    end
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
    list do
        exclude_fields :CR_DATE, :MOD_DATE, :CR_USER_ID, :MOD_USER_ID,:PERMS
    end
    object_label_method do
        :DESCRIZIONE
    end
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
    list do
        exclude_fields :clienti_clienti
    end
    show do
        exclude_fields :clienti_clienti
    end
    edit do
        exclude_fields :clienti_clienti
    end
    object_label_method do
        :email
    end
  end
  config.model 'AuthHub::EnteGestito' do
    label "Ente Gestito" 
    label_plural "Enti Gestiti"
    object_label_method do
        :custom_label_method
    end
  end
#   config.model '::OauthApplication' do
#     label "Applicazione Oauth" 
#     label_plural "Applicazione Oauth"
#   end
#   config.model '::OauthAccessToken' do
#     label "Access Token Oauth" 
#     label_plural "Access Tokens Oauth"
#   end
#   config.model '::OauthAccessGrant' do
#     label "Access Grant Oauth" 
#     label_plural "Access Grants Oauth"
#   end
  config.model 'AuthHub::InfoLoginCliente' do
    label "Info Login Clienti" 
    label_plural "Info Login Clienti"

    field :id do
      label 'Id'
    end
    field :org_name do
      label 'Nome Cliente'
    end
    field :org_display_name do
      label 'Nome Cliente Esteso'
    end
    field :org_url do
      label 'Url Dominio'
    end
    field :client do
      label 'Client'
    end
    field :secret do
      label 'Secret'
    end
    field :cod_ipa_aggregato do
      label 'Cod Ipa'
    end
    field :belfiore_aggregato do
      label 'Cod Belfiore Ente'
    end
    field :issuer do
      label 'EntityID'
    end
    field :app_ext do
      label 'Portale Esterno'
    end
    field :url_app_ext do
      label 'Url Login Esterno Spid/eIDAS'
    end
    field :url_ass_cons_ext do
      label 'Url Ricezione SAML Esterna Spid/eIDAS'
    end
    field :url_metadata_ext do
      label 'Url Metadata Spid/eIDAS Esterno'
    end
    field :url_ass_cons_ext_cie do
      label 'Url Ricezione SAML Esterna CIE'
    end
    field :url_metadata_ext_cie do
        label 'Url Metadata CIE Esterno'
    end
    field :key_path do
      label 'Chiave Priv Cliente'
    end
    field :cert_path do
        label 'Cert Cliente'
    end
    field :spid do
      label 'Spid Attivo'
    end
    field :spid_pre_prod do
        label 'Spid Pre Prod Attivo'
    end
    field :cie do
        label 'CIE Attivo'
    end
    field :cie_pre_prod do
        label 'CIE Pre Prod Attivo'
    end
    field :eidas do
        label 'eIDAS Attivo'
    end
    field :eidas_pre_prod do
        label 'eIDAS Pre Prod Attivo'
    end
    field :aggregato do
        label 'Aggregato'
    end 
    field :p_iva_aggregato do
        label 'P. IVA Ente'
    end
    field :cf_aggregato do
        label 'CF Ente'
    end
    field :email_aggregato do
        label 'E-Mail Aggregato'
    end
    field :telefono_aggregato do
        label 'Telefono Ente'
    end
    field :index_consumer do
        label 'Index Servizio'
    end
    field :campi_richiesti do
        label 'Campi Richiesti'
    end
    include_all_fields #include anche il clienti_cliente_id per collegamenti con clienti
    list do
      exclude_fields :stato_metadata, :org_display_name, :secret, :url_app_ext, :url_ass_cons_ext, :url_metadata_ext, :url_ass_cons_ext_cie, :url_metadata_ext_cie, :key_path, :cert_path, :issuer, :spid_pre_prod
    end
    show do
        exclude_fields :stato_metadata
    end
    edit do
        exclude_fields :id, :stato_metadata
        include_fields :clienti_cliente_id  
    end
  end

  config.model 'AuthHub::IoService' do
    label "Servizi IO" 
    label_plural "Servizi IO"
  end

  
  
  config.parent_controller = 'ApplicationController'
  
  
  
end
