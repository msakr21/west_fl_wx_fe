Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'pages#welcome'
  get '/sessions/new', to: 'sessions#new', as: :login

  resources :users, only: [:new, :create, :show]
  resources :cars, only: [:create, :update]
  resources :houses, only: [:create, :update]
  resources :kids, only: [:create, :update]
  resources :pets, only: [:create, :update]
  resources :plans, only: [:create, :update]
  resources :prep_kits, only: [:create, :update]
  resources :records, only: [:create, :update]
end
