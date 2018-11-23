Rails.application.routes.draw do

  root 'users#index'
  get '/users/show', to: 'users#show'

  devise_for :users


end
