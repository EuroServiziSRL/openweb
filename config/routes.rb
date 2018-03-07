Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/dbadmin', as: 'rails_admin'
  mount AuthHub::Engine => "/auth_hub", as: 'auth_hub'
  
  get "/test/:page" => "test#show"
  
  get 'cambia_ente' => "application#cambia_ente", :as => :cambia_ente
  get 'error_dati' => "suite#error_dati", :as => :error_dati
  
  root to: "suite#index"

end