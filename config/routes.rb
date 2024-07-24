Rails.application.routes.draw do
  root "boards#index"
  resource :session, only: %i[ new create destroy ]
  resources :users
  resources :features
  resources :boards

  get "/profile", to: "profiles#edit"

  get "up" => "rails/health#show", as: :rails_health_check
end
