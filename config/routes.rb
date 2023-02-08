Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root to: 'users#index'

  resources :users, only: %i[index]
  resources :foods, only: %i[index new create destroy]
end
