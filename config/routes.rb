Rails.application.routes.draw do
  resources :orders
  resources :products
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users do
    collection do
      post :accept_membership
      post :decline_membership
      post :cancel_membership
      post :remove_from_group
      post :cancel_invitation
      post :block_membership
      post :block_user
      post :toggle_admin
      post :transfer_ownership
    end
  end
  get 'home/index'
  resources :home
  root to: 'home#index'
end