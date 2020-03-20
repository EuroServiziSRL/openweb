class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true
    include Error::ErrorHandler
    before_action :set_configuration
    rescue_from ActiveRecord::StatementInvalid, :with => :db_error_handler

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_path, alert: exception.message
    end

    def set_configuration
      I18n.locale = Settings.locale || I18n.default_locale
      ActionMailer::Base.default_url_options = {:host => (Settings.dominio_email.blank? ? request.host_with_port : Settings.dominio_email) }
      Rails.configuration.url_dominio = request.base_url if Rails.configuration.url_dominio.blank?
    end
    
    #Se non trovo la tabella e sto cercando su un db diverso da quello principale
    #riconnetto active record sul db primario e poi ritorno alla action di prima
    def db_error_handler(exception)
        if !(exception.message =~(/Table '(\w+).(\w+)' doesn't exist/i)).nil?
            matchdata = exception.message.match(/Table '(\w+).(\w+)' doesn't exist/i)
            if !matchdata[1].blank? && matchdata[1] != 'openweb' 
                config   = Rails.configuration.database_configuration
                host     = config[Rails.env]["host"]
                database = config[Rails.env]["database"]
                username = config[Rails.env]["username"]
                password = config[Rails.env]["password"]
                default_params = { :adapter  => "mysql2",
                               :host     => host,
                               :username => username,
                               :password => password,
                               :database => database }
                
                ActiveRecord::Base.establish_connection(default_params)
                redirect_to :controller => params['controller'], :action => params['action']
                return
            end
        else
            raise ActionController::RoutingError.new('Not Found')
        end
        
    end

    #ROOT della main_app
    def index
    end
    
    #da fare
    def error_dati
    end
    
    protected
    
    #helper per ricavare l'utente corrente loggato
    def current_user
      #carico l'user da sessione con auth esterna tramite omniauth
      @current_user ||= AuthHub::User.find_by(id: session['warden.user.user.key'][0][0]) unless session['warden.user.user.key'].blank?
      #se non ho fatto login esterna carico id salvato (usato in sign_in omniauth e anche login con email e psw devise)
      @current_user ||= AuthHub::User.find_by(id: session[:user_id], stato: 'confermato')
      #se ho uno user corrente carico in sessione l'ente corrente
      #se ha un ente principale carico quello, altrimenti l'ho fissato col cambia ente
      if !@current_user.blank? && session['ente_corrente'].blank?
        ente_principale ||= ( AuthHub::EnteGestito.ente_principale_da_user(@current_user.id)[0] unless AuthHub::EnteGestito.ente_principale_da_user(@current_user.id).blank? )
        #se non era stato inserito l'ente principale per lo user prendo il primo dell'array
        ente_principale ||= @current_user.enti_gestiti[0] unless @current_user.enti_gestiti.blank?
        session['ente_corrente'] = ente_principale #unless ente_principale.blank?
      end
      #se session['ente_corrente'] è un hash devo caricare l'istanza di ente_gestito
      if session['ente_corrente'].is_a?(Hash)
        session['ente_corrente'] = AuthHub::EnteGestito.find(session['ente_corrente']['id'])
      end
      @current_user
    end
    
    
    
end
