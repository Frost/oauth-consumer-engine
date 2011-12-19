Rails.application.routes.draw do
  # omniauth
  match 'auth/:provider/callback', :to => 'login/user_sessions#create'
  match 'auth/failure', :to => 'login/user_sessions#failure'

  match '/auth/engine_id', :as => :login

  # Custom logout
  match '/logout', :to => 'login/user_sessions#destroy', :as => :logout
end
