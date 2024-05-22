Rails.application.routes.draw do
  devise_for :users

  namespace :portal do
    resources :boards
    resources :features
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
