Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :products
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  get 'home/index'
  resources :home
  root to: 'home#index'
end