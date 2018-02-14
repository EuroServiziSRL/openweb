Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/dbadmin', as: 'rails_admin'
  mount AuthHub::Engine => "/auth_hub", as: 'auth_hub'
  
  get "/test/:page" => "test#show"
  
  get 'error_dati' => "application#error_dati", :as => :error_dati
  
  root to: "suite#index"

end
