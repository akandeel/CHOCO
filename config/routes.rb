Rails.application.routes.draw do
  #get '/welcome' to: 'pages#home'
  #get '/about_us' to: 'pages#about_us'
  get '/signup', to: 'consumers#new'
  post '/signup', to: 'consumers#create'
  #get '/my_account' to: 'consumers#show'
  #get '/about_us', to: 'pages#about_us'
  root :to => 'pages#home'
  resources :consumers

  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/login',  to: 'sessions#destroy'

  #get '/login', to: 'sessions#new'
  #post '/login', to: 'sessions#create'
  #resources :pages
  #resources :sessions

  #get '/consumers/:id/edit' => 'consumers#edit' as: :edit_consumer
  #patch '/consumers/:id' => 'consumers#update' as: :update_consumer

  #get '/consumers/:id' => 'consumers#show'
  #get '/consumers/:id' => 'consumers#edit'

  # get '/consumers/new'=> 'consumers#new'
  # => resources :consumers

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
