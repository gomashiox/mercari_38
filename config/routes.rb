Rails.application.routes.draw do


  root 'items#index'
  # devise_for :users , :class_name => 'User'
  devise_for :users, skip: :all
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    get 'signup', to: 'devise/registrations#index', as: :index_user_registration
    get 'signup/registration', to: 'devise/registrations#new', as: :new_user_registration
    post 'signup/registration', to: 'devise/registrations#create', as: :registration
    get 'signup/sms_confirmation', to: 'devise/registrations#confirm', as: :user_sms_confirmation
    get 'signup/sms_authorization', to: 'devise/registrations#auth', as: :user_sms_authorization
    get 'signup/address', to: 'devise/registrations#address', as: :new_user_address
    post 'signup/address', to: 'devise/registrations#create', as: :address
    get 'signup/creditcard', to: 'devise/registrations#card', as: :new_user_card
    post 'signup/creditcard', to: 'devise/registrations#create', as: :card
    get 'signup/complete', to: 'devise/registrations#complete', as: :new_user_complete
  end
  resources :users, only: [:show, :index, :update]

  resource :items do
    collection do
      get 'get_category_ms'
      get 'get_category_ss'
      get  'deal'
      # /profiles/get_cities
    end
  end
end

#                   Prefix Verb   URI Pattern                    Controller#Action
#                     root GET    /                              items#index
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#            user_password PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
#                          POST   /users/password(.:format)      devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#        user_registration PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                          POST   /users(.:format)               devise/registrations#create
#                    users GET    /users(.:format)               users#index
#                     user GET    /users/:id(.:format)           users#show
