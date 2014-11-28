Adoptamedellin::Application.routes.draw do
  resources :adoption_pets do
    post :recommend
  end

  resources :interested_contacts

  resources :sessions, :only => [:create]

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "faq" => "application#faq"
  get "contact" => "application#contact"

  root :to => 'adoption_pets#index'
end
