Rails.application.routes.draw do
  resources :comments
  # resources :coffee_shops
  # resources :users
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
  get '/autologin', to: 'users#autologin'

  post '/loadShops', to: 'coffee_shops#loadShops'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
