Rails.application.routes.draw do
  get "/", to: 'pages#welcome', as: 'root'
  get '/auth/:provider/callback', to: 'sessions#new'
  resources :users, only: [:update, :edit, :show]
end
