Rails.application.routes.draw do

  resources :invoices

  resources :accounts do
    resources :account_add_funds, only: [:new, :create]
  end
  
  devise_for :users

  root to: "home#index"

end
