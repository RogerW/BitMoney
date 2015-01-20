Rails.application.routes.draw do

  get 'account/index'

  get 'account/show'

  get 'account/new'

  devise_for :users

  root to: "home#index"

end
