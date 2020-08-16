Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :gives
  resources :rooms
  resources :room_messages

  root 'application#landing'
  patch 'update_user', to: 'users#update'
  # TODO: currently redirecting to landing after refreshing sign up page after failure. Otherwise would go to error page. Fix the error page issue.
  get 'users', to: 'application#landing'
  get 'browse', to: 'users#browse'
  get 'search', to: 'gives#search'
  get 'room', to: 'rooms#show'

end
