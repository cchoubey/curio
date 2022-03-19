Rails.application.routes.draw do
  resources :brands
  resources :orders
  resources :products
  resources :categories
  resources :user_types
  #get 'users/index'
   devise_for :users, controllers: {
     sessions: 'users/sessions',
     registrations: 'users/registrations'
 }
 
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'users/:id' => 'users#edit', :via => :get, :as => :admin_edit_user
  root 'home#index'
  match '/users',   to: 'users#index',   via: 'get'
  match 'orders/by_product_id/:product_id' => 'orders#index', :via => :get, :as => :orders_by_product_id
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
