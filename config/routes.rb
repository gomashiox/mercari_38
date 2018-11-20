Rails.application.routes.draw do

  root 'items#index'
  get '/users/show', to: 'users#show'
  get '/items/:id',  to: 'items#show'

  devise_for :users


end
