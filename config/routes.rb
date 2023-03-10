Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root to: 'public_recipes#index'

  resources :users, only: %i[index]
  resources :recipes, only: %i[index show new create destroy]
  resources :foods, only: %i[index new create destroy]
  resources :recipes_foods, only: %i[new create]
  resources :public_recipes, only: %i[index]
  resources :recipes_foods, only: %i[new create destroy]
  resources :shopping_lists, only: %i[index]
end
