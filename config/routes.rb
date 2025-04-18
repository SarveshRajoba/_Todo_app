Rails.application.routes.draw do
  get "pages/welcome"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "registrations/new"
  get "registrations/create"
  resources :tasks
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#welcome"  # Temporary public root
  get "/welcome", to: "pages#welcome", as: "welcome"

  #--------------------------------Signup page routes#
  get "/signup", to: "registrations#new", as: "signup"
  post "/signup", to: "registrations#create"
  
  #--------------------------------Login page routes#
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
  # config/routes.rb
resources :tasks do
  member do
    patch :mark_as_completed
  end
end

  
end
