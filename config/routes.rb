Rails.application.routes.draw do

  get "signup", to: "users#new"
  get "/login",to: "sessions#new"
  post "login", to: "sessions#create"
  delete "/login", to: "sessions#destroy"
  root "static_pages#home"
  resources :users
end
