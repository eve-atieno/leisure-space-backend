Rails.application.routes.draw do
  resources :galleries
  # resources :names
  resources :reviews
  resources :bookings
  resources :admins
  resources :users
  resources :spaces, only: [:index, :show, :create, :update, :destroy]
  resources :categories, only: [:index, :show, :destroy, :create]

  get "/login", to: "user#login"

end
