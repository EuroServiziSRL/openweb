class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to main_app.root_path, alert: exception.message
    end
    
    def index
    
    end
    
    def error_dati
        
    
    end
    
    
    
end
