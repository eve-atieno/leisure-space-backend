Rails.application.routes.draw do
  resources :media, only: [:show, :index, :create]
  # resources :names
  resources :reviews, only: [:show, :index, :create]
  resources :bookings, only: [:show, :index, :create, :destroy, :checkout]
  # resources :admins, only: [:show, :create]
  # resources :users, only: [:show, :create]
  resources :spaces, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index, :show, :destroy, :create, :update]

  post "/signup", to: "users#create"
  post "/me", to: "users#show"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # admin
  post "/adminin", to: "sessions#in"
  delete "/adminout", to: "sessions#out"
  get "/ad", to: "admins#show"
  post "/newadmin", to: "admins#create"


end
