Rails.application.routes.draw do
  root "boards#index"
  resource :first_time, only: %i[ show create ]
  resource :session, only: %i[ new create destory ]
  resources :users
  resources :features
  resources :boards

  get "up" => "rails/health#show", as: :rails_health_check
end
