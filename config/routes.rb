Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "wonders#index"
  # Declaration of routes
  devise_for :users
  resources :wonders do
    resources :reservations
  end
end
