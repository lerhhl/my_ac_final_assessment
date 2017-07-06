Rails.application.routes.draw do
  devise_for :users
  
  root 'notes#index'

  get 'users/index', to: "users#index"
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :notes
end
