Rails.application.routes.draw do
  resources :user_types
  #get 'users/index'
   devise_for :users, controllers: {
     sessions: 'users/sessions'
 }
 #     registrations: 'users/registrations',
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  match 'users/:id' => 'users#update', :via => :put, :as => :admin_edit_user
  root 'home#index'
  match '/users',   to: 'users#index',   via: 'get'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
