Adoptamedellin::Application.routes.draw do
  resources :adoption_pets do
    resources :interested_contacts
  end

  root :to => 'adoption_pets#index'
end
