Rails.application.routes.draw do



  resources :consumption_types

  resources :invoices

  resources :accounts do
    resources :account_add_funds, only: [:new, :create]
    resources :consumptions

    namespace :account do
      resources :transfers, only: [:new, :create]
    end
  end
  
  devise_for :users

  root to: "home#index"

end
