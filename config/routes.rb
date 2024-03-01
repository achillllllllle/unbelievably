Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "wonders#index"
  # Declaration of routes
  devise_for :users

  resources :wonders do
    resources :reservations, only: %i[create]
    resources :favorites, only: %i[create] do
      collection do
        delete :destroy
      end
    end
  end

  resources :users, only: %i[show]
  resources :reservations, only: %i[edit update destroy]
end
