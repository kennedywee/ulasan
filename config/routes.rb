Rails.application.routes.draw do
  namespace :portal do
    root "boards#index"

    resources :boards do
      resources :features
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
