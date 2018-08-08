Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'products#index'

  resources :users, only: [:index, :new, :show] do
  resources :products, only: [:index, :new, :create, :show]
  end

  resources :addresses, except: [:index, :destroy]
end
