Rails.application.routes.draw do
  get "users/index"
  get "users/new"
  get "users/show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  resources :admins
  # root "admins#index"
  get "admin/not", to: "admins#adminNot"
  root "users#index"
  post "login/user/check", to: "users#loginUser"
  get "login/user", to: "users#login"
  get "admin/allusers", to: "admins#alluser"
  get "user/logOut", to: "users#logOut"
  get "admin/logOut", to: "admins#logOut"
  get "admin/logIn", to: "admins#logIn"
  resources :users
  resources :books
  resources :usersbooks
end
