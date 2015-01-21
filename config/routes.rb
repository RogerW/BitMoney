Rails.application.routes.draw do

  resource :accounts
  devise_for :users

  root to: "home#index"

end
