Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'products#index'
  resources :products, only: [:index, :new]
  resources :addresses, except: [:index, :destroy]
end
