Rails.application.routes.draw do
  #get '/welcome' to: 'pages#home'
  #get '/about_us' to: 'pages#about_us'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  #get '/my_account' to: 'users#show'
  #get '/about_us', to: 'pages#about_us'
  root :to => 'users#new'
  resources :users

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy' #refactor the login and remember to create a logout custom route

  #get '/login', to: 'sessions#new'
  #post '/login', to: 'sessions#create'
  #resources :pages
  #resources :sessions

  #get '/users/:id/edit' => 'users#edit' as: :edit_user
  #patch '/users/:id' => 'users#update' as: :update_user

  #get '/users/:id' => 'users#show'
  #get '/users/:id' => 'users#edit'

  # get '/users/new'=> 'users#new'
  # => resources :users

  #get '/business_sign_up' => 'businesse#business_sign_up'
  #get '/dashboard' => 'businesse#business_dashboard'

  #get '/businesses/:id/edit' => 'businesses#edit'
  #patch '/businesses/:id' => 'businesses#update'
  #post 'businesse' => 'businesse#create'
  #get '/businesses/:id' => 'businesses#show'
  #get '/businesses/new' => 'businesses#new'
  #resources :businesses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # *****ACCOUNT ACTIVATION ROUTES*****

  #resources :account_activations #only [:edit]
end
