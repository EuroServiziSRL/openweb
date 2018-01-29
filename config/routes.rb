Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "suite#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  mount AuthHub::Engine => "/auth_hub"#, as: 'auth_hub'
  
  get "/test/:page" => "test#show"

    
  #get '/auth_hub/users/sign_in', to: 'auth_hub/users/sessions#new'

end
