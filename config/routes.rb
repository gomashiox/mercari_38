Rails.application.routes.draw do

  root 'items#index'
  get '/users/show', to: 'users#show'

  devise_for :users


end
