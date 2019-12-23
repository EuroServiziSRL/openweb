Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin_db', as: 'rails_admin'
  mount AuthHub::Engine => "/auth_hub", as: 'auth_hub'
  mount WikiHd::Engine => "/wiki_hd", as: 'wiki_hd'
  
  #get "/test/:page" => "test#show"
  
  #get 'cambia_ente' => "application#cambia_ente", :as => :cambia_ente
  get 'error_dati' => "application#error_dati", :as => :error_dati
  
  get '/' => 'application#index', :as => :index
  
  root to: "application#index"

end