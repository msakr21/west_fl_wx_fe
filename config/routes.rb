Rails.application.routes.draw do
  get "/", to: 'pages#welcome', as: 'root'
  get '/auth/:provider/callback', to: 'sessions#new'
  resources :users, only: [:update, :edit, :show]
  resources :cars, only: [:create, :update]
  resources :houses, only: [:create, :update]
  resources :kids, only: [:create, :update]
  resources :pets, only: [:create, :update]
  resources :plans, only: [:create, :update]
  resources :prep_kits, only: [:create, :update]
  resources :records, only: [:create, :update]
end
