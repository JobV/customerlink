Rails.application.routes.draw do
  resources :organisations

  root to: 'customers#index'

  resources :customers

  devise_for :users, controllers: { registrations: "users/registrations" }

end
