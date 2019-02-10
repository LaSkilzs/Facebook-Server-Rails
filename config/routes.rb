Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :profiles
      resources :posts
      resources :photos
      resources :comments
    end
  end
  resources :users, param: :_username
  get '/*a', to: 'application#not_found'
  
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  post '/login', to: 'auth#authenticate'
  get '/users/profile', to: 'users#profile'
  get '/welcome', to: 'application#welcome'
  
  
end
