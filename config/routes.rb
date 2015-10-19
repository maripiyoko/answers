Rails.application.routes.draw do
  root 'home#index'

  resources :topics, except: [ :index ] do
    resource :answer, only: [ :create, :destroy ]
    resources :comments, only: [ :create, :destroy ]
  end

  devise_for :users
end
