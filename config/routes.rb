Rails.application.routes.draw do
  root 'home#index'

  resources :topics, except: [ :index ]

  devise_for :users
end
