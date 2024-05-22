Rails.application.routes.draw do
  devise_for :users

  namespace :portal do
    root 'boards#index'

    resources :boards do
      resources :features
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
