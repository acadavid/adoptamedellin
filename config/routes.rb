Adoptamedellin::Application.routes.draw do
  resources :adoption_pets do
    resources :interested_contacts
  end

  resources :sessions, :only => [:create]

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"

  root :to => 'adoption_pets#index'
end
