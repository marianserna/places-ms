Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places, only: [:index, :show]
  resources :trips, only: [:index, :create, :show] do
    resources :invitations, only: [:create]
    resources :buddies, only: [:create]
  end
end
