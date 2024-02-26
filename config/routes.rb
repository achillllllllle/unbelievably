Rails.application.routes.draw do

  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  # Declaration of routes

  root to: "wonders#index"

  get "/wonders/:id", to: "wonders#show"
  get "/wonders/:id", to: "reservations#new"
  get "/wonders/new", to: "wonders#new"
  post "/wonders/:id", to: "reservations#create"
  post "/wonders/:id", to: "wonders#create"

  get "/:username", to: "reservations#index"
  patch "/:username", to: "reservations#update"
  delete "/:username", to: "reservations#destroy"

end
