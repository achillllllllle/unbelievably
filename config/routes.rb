Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check

  # Declaration of routes

  devise_for :users
  resources :wonders

  # root to: "wonders#index"
  # get "/wonders/:id", to: "wonders#show"
  # get "/wonders/:id", to: "reservations#new"
  # get "/wonders/new", to: "wonders#new"
  # post "/wonders/:id", to: "reservations#create"
  # post "/wonders/:id", to: "wonders#create"

end
