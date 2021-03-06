Rails.application.routes.draw do
  get 'orders/index'

  devise_for :users, controllers: {registrations: 'registrations'}
  root 'products#index'

  resources :products, only: [:index, :new, :create, :show, :update] do
    resources :comments, only: [:create]
    resources :orders, only: [:index]
    member do
      get :buy
      get :perchased
      patch :first_update
      put :first_update
      get :dynamic_select_middle
      get :dynamic_select_small
    end
  end

  resources :addresses, except: [:index, :destroy, :show]

  resources :user, only: [:edit, :update, :show] do
    collection do
      get :signout
    end
    member do
      get :listening
      get :in_progress
      get :completed
      get :purchase
      get :purchased
    end
  end

  resources :categories, only: [:index, :show]
  resources :exhibitors, only: [:show]
end

