class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true
    before_action :set_locale
    
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_path, alert: exception.message
    end
    
    

    def set_locale
      I18n.locale = APP_CONFIG['locale'] || I18n.default_locale
    end
    
    def index
    
    end
    
    
end
