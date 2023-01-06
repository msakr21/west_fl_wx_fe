Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'pages#welcome'
  get '/sessions/new', to: 'sessions#new', as: :login

  resources :users, only: [:new, :create, :show]
  resources :plans, only: [:create, :update]
end
