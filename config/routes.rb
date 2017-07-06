Rails.application.routes.draw do
  devise_for :users
  
  root 'notes#index'

  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :notes
end
