Rails.application.routes.draw do
  root   'static_pages#home'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  resources :items

  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'

  resources :users do
    member do
      get :starred, :feed
    end
  end

  resources :lists do
    resources :cons, controller: :items, :defaults => { :pro_con => false }
    resources :pros, controller: :items, :defaults => { :pro_con => true }
    member do
      get :starrers
      get  'permissions', :action => 'edit_access'
      post 'permissions', :action => 'update_access'
    end
  end

  resources :stars, only: [:create, :destroy]
end
