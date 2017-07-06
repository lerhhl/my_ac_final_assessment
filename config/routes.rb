Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'notes#index'
  get 'users/index', to: "users#index"
  get 'notes/show_all', to: "notes#show_all"  

  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :notes
end
