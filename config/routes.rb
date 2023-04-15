Rails.application.routes.draw do
  resources :galleries
  resources :names
  resources :reviews
  resources :bookings
  resources :admins
  resources :users
  resources :spaces, only: [:index, :show, :create]

  get "/login", to: "user#login"

end
