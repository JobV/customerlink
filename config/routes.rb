Rails.application.routes.draw do
  resources :integrations

  resources :organisations

  root to: 'customers#index'

  resources :customers
  resources :integrations, only: [:index]

  devise_for :users, controllers: { registrations: "users/registrations" }

end
