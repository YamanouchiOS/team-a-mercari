Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :users, only: [:index, :new, :show] do
  resources :products, only: [:index, :new, :show]
  end
  resources :addresses, except: [:index, :destroy]
end
