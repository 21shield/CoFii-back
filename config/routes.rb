Rails.application.routes.draw do
  post '/comments', to: 'comments#create'
  get '/comments', to: 'comments#index'
  # resources :coffee_shops
  # resources :users
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
  get '/autologin', to: 'users#autologin'

  post '/loadShops', to: 'coffee_shops#loadShops'
  get '/coffee_shops', to: 'coffee_shops#index'
 
end
