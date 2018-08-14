Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  root 'products#index'

  resources :products, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
  end
  resources :addresses, except: [:index, :destroy, :show]
  resources :user, only: [:edit, :update, :show] do
    collection do
      get 'signout'
    end
  end
  resources :categories, only: [:index, :show]
  get 'product/buy/:id', to: 'products#buy'
  patch 'prodcut/perchase/:id', to: 'products#first_update'
  put 'prodcut/perchase/:id', to: 'products#first_update'
end
