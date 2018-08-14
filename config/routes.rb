Rails.application.routes.draw do
  get 'orders/index'

  devise_for :users, controllers: {registrations: 'registrations'}
  root 'products#index'

  resources :products, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create]
    resources :orders, only: [:index]
    member do
      get :buy
      get :perchased
      patch :first_update
      put :first_update
    end
  end

  resources :addresses, except: [:index, :destroy, :show]

  resources :user, only: [:edit, :update, :show] do
    collection do
      get 'signout'
    end
  end

  resources :categories, only: [:index, :show]
end

