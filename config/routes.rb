Rails.application.routes.draw do
  resources :places, only: [:index, :show]
  resources :trips, only: [:index, :create, :show, :update], param: :uuid do
    resources :invitations, only: [:create]
    resources :buddies, only: [:index, :create]
    resources :messages, only: [:index]
    resources :stops, only: [:index, :create, :destroy]
    resources :trip_images, only: [:index, :create]

    member do
      get :video_token
    end
  end
end
