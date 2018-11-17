Rails.application.routes.draw do
<<<<<<< HEAD
  root 'items#index'
  get '/users/show', to: 'users#show'

  devise_for :users
=======
  devise_for :users
  root 'users#index'
>>>>>>> Mame1209/master

end
