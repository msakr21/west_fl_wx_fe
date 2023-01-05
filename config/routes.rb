Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'pages#welcome'
  get "/users/new", to: 'users#new'
  get "/users/:id", to: 'users#show'
  post"/users", to: 'users#create'
  get "/login", to: 'pages#login'
end
