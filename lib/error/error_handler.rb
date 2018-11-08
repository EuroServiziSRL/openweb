# Error module to Handle errors globally
# include Error::ErrorHandler in application_controller.rb
module Error
  module ErrorHandler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
        rescue_from ActiveRecord::NoDatabaseError, with: :no_database_error
      end
    end

    private
    def record_not_found(exc)
      flash[:error] = "Dati non trovati"
      redirect_to index_admin_path
    end
    
    #se non riesce a fare la connessione al db che non esiste vado qui, rimetto la connessione sul db di auth_hub e torno in admin
    def no_database_error(exc)
      Thread.current[:db_name] = 'openweb_'+(Rails.env == 'production' ? 'prod' : 'devel') 
      AuthHub::SpiderModel.establish_connection({})
      flash[:error] = "Non è possibile gestire le configurazioni dell'ente!"
      redirect_to index_admin_path
    end
  end
end