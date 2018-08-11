Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'products#index'

  resources :products, only: [:index, :new, :create, :show]
  resources :addresses, except: [:index, :destroy, :show]
  resources :user, only: [:edit, :update, :show]
end
