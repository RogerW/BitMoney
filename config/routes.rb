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


  get "/pages/*id" => 'pages#show', as: :page, format: false

  devise_for :users, :controllers => {sessions: 'sessions'}

  devise_scope :user do
    authenticated :user do
      root 'pages#show', id: 'account',  as: :authenticated_root
      # root 'accounts#index', as: :authenticated_root
    end
    unauthenticated do
      root 'pages#show', id: 'welcome', as: :unauthenticated_root
    end
  end


  # root to: "home#index"

end
