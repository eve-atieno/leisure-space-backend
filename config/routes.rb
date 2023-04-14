Rails.application.routes.draw do
  resources :galleries
  resources :names
  resources :reviews
  resources :bookings
  resources :admins
  resources :users
  resources :spaces, only: [:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
