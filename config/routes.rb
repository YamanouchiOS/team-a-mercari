Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'products#index'

  resources :users, only: [:index, :new, :show]
  resources :products, only: [:index, :new, :create, :show]
  resources :addresses, except: [:index, :destroy]
end
