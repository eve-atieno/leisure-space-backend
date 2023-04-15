Rails.application.routes.draw do
  resources :galleries
  resources :reviews
  resources :bookings
  resources :admins
  resources :users
  resources :spaces, only: [:index, :show, :create]

  get "/login", to: "user#login"

  #Users
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show"
  get "/", to: "users#index"

  # admin
  post "/admins", to: "admins#create"
  get "/admins/:id", to: "admins#show"
  get "/admins", to: "admins#index"
  
  

end
