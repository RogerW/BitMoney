Rails.application.routes.draw do

  resources :consumption_types

  resources :invoices

  resources :accounts do

    # resources :consumptions
  end

  namespace :account do
    resources :transfers, only: [:new, :create]
    resources :add_consumptions, only: [:new, :create]
    resources :add_funds, only: [:new, :create]
  end
  
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'accounts#index', as: :authenticated_root
    end
    unauthenticated do
      root 'high_voltage/pages#show', id: 'welcome', as: :unauthenticated_root
    end
  end


  # root to: "home#index"

end
