Rails.application.routes.draw do
  resources :media
  resources :reviews
  resources :bookings
  resources :spaces
  resources :profiles
  resources :admins
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "user#login"

  # USERs routes
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  post "/users", to: "users#create"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  # ADMINs routes
  get "/admins", to: "admins#index"
  get "/admins/:id", to: "admins#show"
  post "/admins", to: "admins#create"
  patch "/admins/:id", to: "admins#update"
  delete "/admins/:id", to: "admins#destroy"

  # BOOKINGs routes
  get "/bookings", to: "bookings#index"
  get "/bookings/:id", to: "bookings#show"
  post "/bookings", to: "bookings#create"
  patch "/bookings/:id", to: "bookings#update"
  delete "/bookings/:id", to: "bookings#destroy"

  # REVIEWs routes
  get "/reviews", to: "reviews#index"
  get "/reviews/:id", to: "reviews#show"
  post "/reviews", to: "reviews#create"
  patch "/reviews/:id", to: "reviews#update"
  delete "/reviews/:id", to: "reviews#destroy"

  # PROFILEs routes
  get "/profiles", to: "profiles#index"
  get "/profiles/:id", to: "profiles#show"
  post "/profiles", to: "profiles#create"
  patch "/profiles/:id", to: "profiles#update"
  delete "/profiles/:id", to: "profiles#destroy"

  # MEDIA routes
  get "/media", to: "media#index"
  get "/media/:id", to: "media#show"
  post "/media", to: "media#create"
  patch "/media/:id", to: "media#update"
  delete "/media/:id", to: "media#destroy"

  # SPACEs routes
  get "/spaces", to: "spaces#index"
  get "/spaces/:id", to: "spaces#show"
  post "/spaces", to: "spaces#create"
  patch "/spaces/:id", to: "spaces#update"
  delete "/spaces/:id", to: "spaces#destroy"

  

  
  

end
