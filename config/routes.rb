Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :toilets, only:[:index, :show] do
    resource :bookings, only: [:create]
  end
  resources :bookings, only: [:index, :edit, :update]
  namespace :owner do
    resources :bookings, only: [:index]
  end
end
