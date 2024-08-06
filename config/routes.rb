Rails.application.routes.draw do
  root "boards#index"
  resource :session, only: %i[ new create destroy ]
  resources :users

  resources :boards do
    resources :features do
      resources :votes, only: %i[create destroy]
      resources :comments
    end
  end

  get "/profile", to: "profiles#edit"
  patch "/profile", to: "profiles#update"

  get "up" => "rails/health#show", as: :rails_health_check
end
