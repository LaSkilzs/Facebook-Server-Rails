Rails.application.routes.draw do
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  post '/login', to: 'auth#authenticate'
  get '/users/profile', to: 'users#profile'
  get '/welcome', to: 'application#welcome'
 

  resources :users, param: :_username
  get '/*a', to: 'application#not_found'
end
