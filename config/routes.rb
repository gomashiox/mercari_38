Rails.application.routes.draw do

  root 'users#index'
  get '/users/show', to: 'users#show'
  get   'users/:id'   =>  'users#show'
  devise_for :users


  resources :items do
    collection do
      get 'get_category_ms' # /profiles/get_cities
    end
  end
end
