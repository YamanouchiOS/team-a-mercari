Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'products#index'

  resources :products, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end
  resources :addresses, except: [:index, :destroy, :show]
  resources :user, only: [:edit, :update, :show]
  resources :categories, only: [:index, :show]
end
