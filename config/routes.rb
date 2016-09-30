Rails.application.routes.draw do
  resources :items
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post    '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :starred, :feed
    end
  end
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :lists do
    member do
      get :starrers
      resources :cons, controller: :items, :defaults => { :item_type => false }
      resources :pros, controller: :items, :defaults => { :item_type => true }
    end
  end
  resources :stars, only: [:create, :destroy]

end
