Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :integrations
  resources :organisations

  resources :users

  root to: 'customers#index'

  resources :customers
  resources :integrations, only: [:index]


end
