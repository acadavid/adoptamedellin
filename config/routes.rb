Adoptamedellin::Application.routes.draw do
  resources :adoption_pets

  root :to => 'adoption_pets#index'
end
